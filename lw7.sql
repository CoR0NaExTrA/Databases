USE University
--1. �������� ������� �����.--
--ALTER TABLE dbo.lesson
--ADD CONSTRAINT FK_lesson_teacher
--	FOREIGN KEY (id_teacher) REFERENCES dbo.teacher(id_teacher);

--ALTER TABLE dbo.lesson
--ADD CONSTRAINT FK_lesson_subject
--	FOREIGN KEY (id_subject) REFERENCES dbo.[subject](id_subject);

--ALTER TABLE dbo.lesson
--ADD CONSTRAINT FK_lesson_group
--	FOREIGN KEY (id_group) REFERENCES dbo.[group](id_group);

--ALTER TABLE dbo.mark
--ADD CONSTRAINT FK_mark_lesson
--	FOREIGN KEY (id_lesson) REFERENCES dbo.lesson(id_lesson);

--ALTER TABLE dbo.mark
--ADD CONSTRAINT FK_mark_student
--	FOREIGN KEY (id_student) REFERENCES dbo.student(id_student);

--ALTER TABLE dbo.student
--ADD CONSTRAINT FK_student_group
--	FOREIGN KEY (id_group) REFERENCES dbo.[group](id_group);

--2. ������ ������ ��������� �� ����������� ���� ��� ��������� �������--
--��������. �������� ������ ������ � �������������� view.--
--GO
--CREATE VIEW v_marks_informatics AS
--SELECT 
--    s.id_student, 
--    s.name AS student_name, 
--    g.name AS group_name, 
--    subj.name AS subject_name, 
--    t.name AS teacher_name, 
--    l.date AS lesson_date, 
--    m.mark
--FROM dbo.mark m
--JOIN dbo.lesson l ON m.id_lesson = l.id_lesson
--JOIN dbo.student s ON m.id_student = s.id_student
--JOIN dbo.[group] g ON s.id_group = g.id_group
--JOIN dbo.subject subj ON l.id_subject = subj.id_subject
--JOIN dbo.teacher t ON l.id_teacher = t.id_teacher
--WHERE subj.name = '�����������';
--GO

SELECT * FROM v_marks_informatics;

--3. ���� ���������� � ��������� � ��������� ������� �������� � ��������--
--��������. ���������� ��������� ��������, �� ������� ������ �� ��������,--
--������� ������� � ������. �������� � ���� ���������, �� �����--
--������������� ������.--
--GO
--CREATE PROCEDURE GetDebtorsByGroup
--    @group_id INT
--AS
--BEGIN
--    SET NOCOUNT ON;

--    SELECT 
--        s.name AS student_name,
--        subj.name AS subject_name
--    FROM dbo.lesson l
--    JOIN dbo.subject subj ON l.id_subject = subj.id_subject
--    JOIN dbo.student s ON s.id_group = l.id_group
--    LEFT JOIN dbo.mark m ON m.id_lesson = l.id_lesson AND m.id_student = s.id_student
--    WHERE s.id_group = @group_id AND m.id_mark IS NULL;
--END;
--GO

EXEC GetDebtorsByGroup @group_id = 1;

--4. ���� ������� ������ ��������� �� ������� �������� ��� ��� ���������, ��--
--������� ���������� �� ����� 35 ���������.--
SELECT 
    subj.name AS subject_name,
    AVG(m.mark) AS average_mark
FROM dbo.mark m
JOIN dbo.lesson l ON m.id_lesson = l.id_lesson
JOIN dbo.subject subj ON l.id_subject = subj.id_subject
JOIN (
    -- ������������ ���������� ���������� ��������� �� ������� ��������
    SELECT 
        l.id_subject,
        COUNT(DISTINCT s.id_student) AS student_count
    FROM dbo.lesson l
    JOIN dbo.student s ON s.id_group = l.id_group
    GROUP BY l.id_subject
    HAVING COUNT(DISTINCT s.id_student) >= 35
) AS student_counts ON l.id_subject = student_counts.id_subject
GROUP BY subj.name;

--5. ���� ������ ��������� ������������� �� �� ���� ���������� ��������� �--
--��������� ������, �������, ��������, ����. ��� ���������� ������ ���������--
--���������� ���� ������.--
SELECT
    g.name AS group_name,
    s.name AS student_name,
    subj.name AS subject_name,
    l.date AS lesson_date,
    COALESCE(m.mark, 0) AS mark
FROM dbo.student s
JOIN dbo.[group] g ON s.id_group = g.id_group
JOIN dbo.lesson l ON g.id_group = l.id_group
JOIN dbo.subject subj ON l.id_subject = subj.id_subject
LEFT JOIN dbo.mark m ON l.id_lesson = m.id_lesson AND s.id_student = m.id_student
WHERE g.name LIKE '%��%'
ORDER BY g.name, s.name, subj.name, l.date;

--6. ���� ��������� ������������� ��, ���������� ������ ������� 5 �� ��������--
--�� �� 12.05, �������� ��� ������ �� 1 ����.--
UPDATE m
SET m.mark = m.mark + 1
FROM dbo.mark m
JOIN dbo.lesson l ON m.id_lesson = l.id_lesson
JOIN dbo.subject subj ON l.id_subject = subj.id_subject
JOIN dbo.student s ON m.id_student = s.id_student
JOIN dbo.[group] g ON s.id_group = g.id_group
WHERE subj.name = '��'
  AND g.name LIKE '%��%'
  AND m.mark < 5
  AND l.date <= '2024-05-12';

--7. �������� ����������� �������.--
--��������� ������� ������.--
CREATE INDEX idx_mark_lesson_student ON dbo.mark(id_lesson, id_student);
--������� ����� �������.--
CREATE INDEX idx_lesson_group_subject_date ON dbo.lesson(id_group, id_subject, date);
--��������� ����� ��������� � �����.--
CREATE INDEX idx_student_group ON dbo.student(id_group);