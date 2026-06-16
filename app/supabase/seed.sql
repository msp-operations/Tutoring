-- Seed data generated from 'Info for tutor registration tool.xlsx' (MSP 2026/2027).
-- Safe to re-run: clears existing catalog first. Does NOT touch live registrations made through the app
-- except the pre-assigned ones it manages. Run AFTER schema.sql.
begin;
delete from registration where tutor_type = 'Pre-assigned';
delete from tutorial_group;
delete from course;

insert into course (code, title, period, department, sort) values
  ('BIO2004', 'General Zoology', 'P1', 'MSP', 0),
  ('CHE1101', 'Introduction to Chemistry', 'P1', 'MSP', 1),
  ('CHE2004', 'Spectroscopy', 'P1', 'MSP', 2),
  ('CHE3010', 'Inorganic Chemistry', 'P1', 'MSP', 3),
  ('INT2013', 'Fundamentals of Science Education', 'P1', 'MSP', 4),
  ('MAT2007', 'Introduction to Programming', 'P1', 'MSP', 5),
  ('PHY1101', 'Introduction to Physics', 'P1', 'MSP', 6),
  ('PHY2009', 'Stellar Astronomy', 'P1', 'MSP', 7),
  ('BIO1101', 'Introduction to Biology', 'P2', 'MSP', 8),
  ('INT1101', 'Introduction to Liberal Arts & Sciences', 'P2', 'MSP', 9),
  ('MAT2009', 'Multivariable Calculus', 'P2', 'MSP', 10),
  ('PHY2010', 'Galactic Astronomy', 'P2', 'MSP', 11);

-- Tutorial groups
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1 + B1', 'Wed', '10:15', '11:45', 'Fri', '14:00', '15:30', 1, 0 from course where code='BIO2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2 + B2', 'Wed', '10:15', '11:45', 'Fri', '14:00', '15:30', 1, 1 from course where code='BIO2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+ B3', 'Wed', '12:00', '13:30', 'Fri', '15:45', '17:15', 1, 2 from course where code='BIO2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4 + B4', 'Wed', '12:00', '13:30', 'Fri', '15:45', '17:15', 1, 3 from course where code='BIO2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 0 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 1 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 2 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 3 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Mon', '08:30', '10:00', 'Thurs', '12:00', '13:30', 1, 4 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Mon', '08:30', '10:00', 'Thurs', '12:00', '13:30', 1, 5 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Mon', '08:30', '10:00', 'Thurs', '12:00', '13:30', 1, 6 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A8+B8', 'Mon', '08:30', '10:00', 'Thurs', '12:00', '13:30', 1, 7 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A9+B9', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 8 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A10+B10', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 9 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A11+B11', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 10 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A12+B12', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 11 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A13+B13', 'Tue', '10:15', '11:45', 'Fri', '08:30', '10:00', 1, 12 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A14+B14', 'Tue', '10:15', '11:45', 'Fri', '08:30', '10:00', 1, 13 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A15+B15', 'Tue', '10:15', '11:45', 'Fri', '08:30', '10:00', 1, 14 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A16+B16', 'Tue', '10:15', '11:45', 'Fri', '08:30', '10:00', 1, 15 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A17+B17', 'Tue', '12:00', '13:30', 'Fri', '10:15', '11:45', 1, 16 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A18+B18', 'Tue', '12:00', '13:30', 'Fri', '10:15', '11:45', 1, 17 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A19+B19', 'Tue', '12:00', '13:30', 'Fri', '10:15', '11:45', 1, 18 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A20+B20', 'Tue', '12:00', '13:30', 'Fri', '10:15', '11:45', 1, 19 from course where code='CHE1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '10:15', '11:45', 'Wed', '14:00', '15:30', 1, 0 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '10:15', '11:45', 'Wed', '14:00', '15:30', 1, 1 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '10:15', '11:45', 'Wed', '14:00', '15:30', 1, 2 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '10:15', '11:45', 'Wed', '14:00', '15:30', 1, 3 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Mon', '12:00', '13:30', 'Wed', '15:45', '17:15', 1, 4 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Mon', '12:00', '13:30', 'Wed', '15:45', '17:15', 1, 5 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Mon', '12:00', '13:30', 'Wed', '15:45', '17:15', 1, 6 from course where code='CHE2004' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 0 from course where code='CHE3010' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 1 from course where code='CHE3010' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 2 from course where code='CHE3010' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 3 from course where code='CHE3010' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Wed', '10:15', '11:45', 'Fri', '14:00', '15:30', 1, 0 from course where code='INT2013' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Wed', '10:15', '11:45', 'Fri', '14:00', '15:30', 1, 1 from course where code='INT2013' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Wed', '10:15', '11:45', 'Fri', '14:00', '15:30', 1, 2 from course where code='INT2013' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Wed', '12:00', '13:30', 'Fri', '15:45', '17:15', 1, 3 from course where code='INT2013' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Wed', '12:00', '13:30', 'Fri', '15:45', '17:15', 1, 4 from course where code='INT2013' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 0 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 1 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 2 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 3 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 4 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 5 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 6 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A8+B8', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 7 from course where code='MAT2007' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Tue', '14:00', '15:30', 'Fri', '08:30', '10:00', 1, 0 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Tue', '14:00', '15:30', 'Fri', '08:30', '10:00', 1, 1 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Tue', '14:00', '15:30', 'Fri', '08:30', '10:00', 1, 2 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Tue', '14:00', '15:30', 'Fri', '08:30', '10:00', 1, 3 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Tue', '10:15', '11:45', 'Fri', '10:15', '11:45', 1, 4 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Tue', '10:15', '11:45', 'Fri', '10:15', '11:45', 1, 5 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Tue', '10:15', '11:45', 'Fri', '10:15', '11:45', 1, 6 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A8+B8', 'Tue', '10:15', '11:45', 'Fri', '10:15', '11:45', 1, 7 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A9+B9', 'Tue', '12:00', '13:30', 'Fri', '12:00', '13:30', 1, 8 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A10+B10', 'Tue', '12:00', '13:30', 'Fri', '12:00', '13:30', 1, 9 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A11+B11', 'Tue', '12:00', '13:30', 'Fri', '12:00', '13:30', 1, 10 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A12+B12', 'Tue', '12:00', '13:30', 'Fri', '12:00', '13:30', 1, 11 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A13+B13', 'Mon', '12:00', '13:30', 'Thurs', '14:00', '15:30', 1, 12 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A14+B14', 'Mon', '12:00', '13:30', 'Thurs', '14:00', '15:30', 1, 13 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A15+B15', 'Mon', '12:00', '13:30', 'Thurs', '14:00', '15:30', 1, 14 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A16+B16', 'Mon', '12:00', '13:30', 'Thurs', '14:00', '15:30', 1, 15 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A17+B17', 'Mon', '08:30', '10:00', 'Thurs', '10:15', '11:45', 1, 16 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A18+B18', 'Mon', '08:30', '10:00', 'Thurs', '10:15', '11:45', 1, 17 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A19+B19', 'Mon', '08:30', '10:00', 'Thurs', '10:15', '11:45', 1, 18 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A20+B20', 'Mon', '08:30', '10:00', 'Thurs', '10:15', '11:45', 1, 19 from course where code='PHY1101' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A/01', 'Mon', '10:15', '11:45', 'Wed', '15:45', '17:15', 1, 0 from course where code='PHY2009' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A/02', 'Mon', '12:00', '13:30', NULL, NULL, NULL, 1, 1 from course where code='PHY2009' and period='P1';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '08:30', '10:00', 'Wed', '08:30', '10:00', 1, 0 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '08:30', '10:00', 'Wed', '08:30', '10:00', 1, 1 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '08:30', '10:00', 'Wed', '08:30', '10:00', 1, 2 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '08:30', '10:00', 'Wed', '08:30', '10:00', 1, 3 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Mon', '08:30', '10:00', 'Wed', '08:30', '10:00', 1, 4 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Mon', '10:15', '11:45', 'Wed', '10:15', '11:45', 1, 5 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Mon', '10:15', '11:45', 'Wed', '10:15', '11:45', 1, 6 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A8+B8', 'Mon', '10:15', '11:45', 'Wed', '10:15', '11:45', 1, 7 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A9+B9', 'Mon', '10:15', '11:45', 'Wed', '10:15', '11:45', 1, 8 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A10+B10', 'Mon', '10:15', '11:45', 'Wed', '10:15', '11:45', 1, 9 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A11+B11', 'Mon', '14:00', '15:30', 'Wed', '14:00', '15:30', 1, 10 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A12+B12', 'Mon', '14:00', '15:30', 'Wed', '14:00', '15:30', 1, 11 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A13+B13', 'Mon', '14:00', '15:30', 'Wed', '14:00', '15:30', 1, 12 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A14+B14', 'Mon', '14:00', '15:30', 'Wed', '14:00', '15:30', 1, 13 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A15+B15', 'Mon', '14:00', '15:30', 'Wed', '14:00', '15:30', 1, 14 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A16+B16', 'Mon', '15:45', '17:15', 'Wed', '15:45', '17:15', 1, 15 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A17+B17', 'Mon', '15:45', '17:15', 'Wed', '15:45', '17:15', 1, 16 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A18+B18', 'Mon', '15:45', '17:15', 'Wed', '15:45', '17:15', 1, 17 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A19+B19', 'Mon', '15:45', '17:15', 'Wed', '15:45', '17:15', 1, 18 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A20+B20', 'Mon', '15:45', '17:15', 'Wed', '15:45', '17:15', 1, 19 from course where code='BIO1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Tue', '10:15', '11:45', 'Thurs', '08:30', '10:00', 1, 0 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Tue', '10:15', '11:45', 'Thurs', '08:30', '10:00', 1, 1 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Tue', '10:15', '11:45', 'Thurs', '08:30', '10:00', 1, 2 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Tue', '10:15', '11:45', 'Thurs', '08:30', '10:00', 1, 3 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A5+B5', 'Tue', '10:15', '11:45', 'Thurs', '08:30', '10:00', 1, 4 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A6+B6', 'Tue', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 5 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A7+B7', 'Tue', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 6 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A8+B8', 'Tue', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 7 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A9+B9', 'Tue', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 8 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A10+B10', 'Tue', '12:00', '13:30', 'Thurs', '10:15', '11:45', 1, 9 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A11+B11', 'Tue', '14:00', '15:30', 'Thurs', '14:00', '15:30', 1, 10 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A12+B12', 'Tue', '14:00', '15:30', 'Thurs', '14:00', '15:30', 1, 11 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A13+B13', 'Tue', '14:00', '15:30', 'Thurs', '14:00', '15:30', 1, 12 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A14+B14', 'Tue', '14:00', '15:30', 'Thurs', '14:00', '15:30', 1, 13 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A15+B15', 'Tue', '14:00', '15:30', 'Thurs', '14:00', '15:30', 1, 14 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A16+B16', 'Tue', '15:45', '17:15', 'Thurs', '15:45', '17:15', 1, 15 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A17+B17', 'Tue', '15:45', '17:15', 'Thurs', '15:45', '17:15', 1, 16 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A18+B18', 'Tue', '15:45', '17:15', 'Thurs', '15:45', '17:15', 1, 17 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A19+B19', 'Tue', '15:45', '17:15', 'Thurs', '15:45', '17:15', 1, 18 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A20+B20', 'Tue', '15:45', '17:15', 'Thurs', '15:45', '17:15', 1, 19 from course where code='INT1101' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 0 from course where code='MAT2009' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Mon', '14:00', '15:30', 'Thurs', '08:30', '10:00', 1, 1 from course where code='MAT2009' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 2 from course where code='MAT2009' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A4+B4', 'Mon', '15:45', '17:15', 'Thurs', '10:15', '11:45', 1, 3 from course where code='MAT2009' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A1+B1', 'Tue', '10:15', '11:45', 'Thurs', '14:00', '15:30', 1, 0 from course where code='PHY2010' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A2+B2', 'Tue', '10:15', '11:45', 'Thurs', '14:00', '15:30', 1, 1 from course where code='PHY2010' and period='P2';
insert into tutorial_group (course_id, label, day1, start1, end1, day2, start2, end2, capacity, sort) select id, 'A3+B3', 'Tue', '12:00', '13:30', 'Thurs', '15:45', '17:15', 1, 2 from course where code='PHY2010' and period='P2';

-- Pre-assigned tutors (already secured in the source sheet) -> seeded as confirmed so their groups show as filled
insert into registration (group_id, tutor_name, tutor_type, affiliation, status) select g.id, 'Basile Roufosse', 'Pre-assigned', 'MSP', 'confirmed' from tutorial_group g join course c on c.id=g.course_id where c.code='CHE3010' and c.period='P1' and g.label='A1+B1';
insert into registration (group_id, tutor_name, tutor_type, affiliation, status) select g.id, 'Basile Roufosse', 'Pre-assigned', 'MSP', 'confirmed' from tutorial_group g join course c on c.id=g.course_id where c.code='CHE3010' and c.period='P1' and g.label='A3+B3';
commit;
