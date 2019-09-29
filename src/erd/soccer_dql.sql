-- SQL_TEST_001
-- ��ü �౸�� ���. �̸� ��������
SELECT TEAM_NAME
FROM TEAM
ORDER BY TEAM_NAME
;

-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����)
SELECT DISTINCT POSITION
FROM PLAYER
;


-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()���
SELECT DISTINCT NVL2(POSITION, POSITION, '����')
FROM PLAYER;
;


-- SQL_TEST_004
-- ������(ID: K02)��Ű��
SELECT *
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND POSITION LIKE 'GK'
;


-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����
SELECT *
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND HEIGHT >= 170
    AND PLAYER_NAME LIKE '��%'
;


-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������
SELECT PLAYER_NAME ������, 
    NVL(HEIGHT,0) || 'CM' Ű, 
    NVL(WEIGHT,0) || 'KG'������
FROM PLAYER
ORDER BY HEIGHT DESC
;



-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI����
-- Ű ��������
SELECT PLAYER_NAME ������, 
    CONCAT(NVL2(HEIGHT,HEIGHT,0),'CM') Ű, 
    CONCAT(NVL2(WEIGHT,WEIGHT,0),'KG') ������,
    ROUND((WEIGHT/(HEIGHT/100*HEIGHT/100)),2)BMI����
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;




--SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ ��
-- �������� GK �� ����
-- ����, ����� ��������
SELECT T.TEAM_NAME, P.PLAYER_NAME
FROM PLAYER P 
    JOIN (SELECT TEAM_ID, TEAM_NAME
          FROM TEAM
          WHERE TEAM_ID IN ('K02','K10'))T
    USING (TEAM_ID)
WHERE P.POSITION LIKE 'GK'
ORDER BY 1,2 DESC
;

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������

SELECT P.HEIGHT Ű, T.TEAM_NAME ����, P.PLAYER_NAME �����
FROM PLAYER P
    JOIN TEAM T
        USING(TEAM_ID)
WHERE TEAM_ID IN ('K02','K10')
    AND HEIGHT BETWEEN 180 AND 183
ORDER BY 1,2,3
;



-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT T.TEAM_NAME ����, P.PLAYER_NAME �����
FROM PLAYER P
    JOIN TEAM T
        USING(TEAM_ID)
WHERE POSITION IS NULL
ORDER BY 1,2
;

-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���

SELECT 
    T.TEAM_NAME ����, 
    S.STADIUM_NAME ��Ÿ���
FROM TEAM T
    JOIN STADIUM S
        USING(STADIUM_ID)
;


-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� �����
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.

SELECT 
    T.TEAM_NAME ���̸�, 
    S.STADIUM_NAME ��Ÿ���, 
   (SELECT TEAM_NAME 
    FROM TEAM
    WHERE TEAM_ID LIKE C.AWAYTEAM_ID) �������, 
    C.SCHE_DATE �������
FROM TEAM T
        JOIN STADIUM S
            USING(STADIUM_ID)
        JOIN SCHEDULE C
            USING(STADIUM_ID)
WHERE C.SCHE_DATE LIKE '20120317'
ORDER BY 1            
;


-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������),
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
SELECT 
    P.PLAYER_NAME ����, 
    P.POSITION ������,
    CONCAT(CONCAT(T.REGION_NAME,' ') ,T.TEAM_NAME) ����,
    S.STADIUM_NAME ��Ÿ���, 
    K.SCHE_DATE ��⳯¥
FROM PLAYER P 
    JOIN TEAM T
        USING(TEAM_ID)
    JOIN STADIUM S 
        USING(STADIUM_ID)
    JOIN SCHEDULE K 
        USING(STADIUM_ID)
WHERE P.POSITION LIKE 'GK'
    AND K.SCHE_DATE LIKE '20120317';
    



-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� �����
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�

SELECT
    ST.STADIUM_NAME �����, 
    SC.SCHE_DATE �������,
    CONCAT(CONCAT(HT.REGION_NAME,' '), HT.TEAM_NAME) Ȩ��,
    CONCAT(CONCAT(AT.REGION_NAME,' '), AT.TEAM_NAME) ������
FROM (SELECT STADIUM_ID,
             SCHE_DATE,
             HOMETEAM_ID,
             AWAYTEAM_ID
      FROM SCHEDULE
      WHERE (HOME_SCORE - AWAY_SCORE) >= 3) SC
    JOIN STADIUM ST
        USING (STADIUM_ID)
    JOIN TEAM HT
        ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
    JOIN TEAM AT
        ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
;
        

-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20
SELECT S.*, T.E_TEAM_NAME
FROM STADIUM S 
    LEFT JOIN TEAM T
        ON S.STADIUM_ID LIKE T.STADIUM_ID
;


-- SOCCER_SQL_016
-- ���Ű�� ��õ ������Ƽ������ ���Ű ���� ���� ����
-- ��ID, ����, ���Ű ����

SELECT
    TEAM_ID ��ID,
    T.TEAM_NAME ����,
    ROUND(AVG(P.HEIGHT),2) ���Ű
FROM PLAYER P
    JOIN TEAM T
        USING (TEAM_ID)
GROUP BY TEAM_ID, 
         T.TEAM_NAME
HAVING AVG(P.HEIGHT) < (SELECT AVG(P2.HEIGHT)
                        FROM PLAYER P2
                        WHERE TEAM_ID LIKE 
                            (SELECT T2.TEAM_ID 
                            FROM TEAM T2
                            WHERE T2.TEAM_NAME LIKE '������Ƽ��') )
;



-- SOCCER_SQL_017
-- �������� MF �� �������� �Ҽ����� �� ������, ��ѹ� ���
SELECT 
    TEAM_NAME ����, 
    PLAYER_NAME ������, 
    BACK_NO ��ѹ�
FROM (SELECT PLAYER_NAME ,BACK_NO ,TEAM_ID
      FROM PLAYER
      WHERE POSITION LIKE 'MF') P
    JOIN TEAM T
        USING(TEAM_ID)

;


-- SOCCER_SQL_018
-- ���� Űū ���� 5 ����, ����Ŭ, �� Ű ���� ������ ����

SELECT 
    PLAYER_NAME ������, 
    BACK_NO ��ѹ�, 
    HEIGHT Ű
FROM (SELECT 
            PLAYER_NAME,
            BACK_NO, 
            HEIGHT
      FROM PLAYER
      WHERE HEIGHT IS NOT NULL
      ORDER BY HEIGHT DESC)
WHERE ROWNUM<=5
;


-- SOCCER_SQL_019
-- ���� �ڽ��� ���� ���� ���Ű���� ���� ���� ���� ���
SELECT 
    TEAM_NAME, 
    PLAYER_NAME, 
    HEIGHT,
    BACK_NO
FROM TEAM T
    JOIN PLAYER P
        ON T.TEAM_ID LIKE P.TEAM_ID
WHERE HEIGHT < (SELECT AVG(HEIGHT)
                FROM PLAYER P2
                WHERE P2.TEAM_ID LIKE P.TEAM_ID
                AND P2.HEIGHT IS NOT NULL
                GROUP BY P2.TEAM_ID)     
;


-- SOCCER_SQL_020
-- 2012�� 5�� �Ѵް� ��Ⱑ �ִ� ����� ��ȸ
-- EXISTS ������ �׻� ���������� ����Ѵ�.
-- ���� �ƹ��� ������ �����ϴ� ���� ���� ���̶�
-- ������ �����ϴ� 1�Ǹ� ã���� �߰����� �˻��� �������� �ʴ´�.

SELECT 
    SCHE_DATE ��¥ ,
    STADIUM_NAME �����
FROM STADIUM  
    JOIN SCHEDULE 
        USING(STADIUM_ID)
WHERE EXISTS (SELECT 1 
              FROM SCHEDULE
              WHERE SCHE_DATE 
                BETWEEN '20120501' AND '20120531')
                
-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���
--X.PLAYER_NAME ������
--    ,X.POSITION ������
--    ,X.BACK_NO ��ѹ�
SELECT X.PLAYER_NAME ������
    ,X.POSITION ������
    ,X.BACK_NO ��ѹ�
FROM PLAYER X
WHERE X.TEAM_ID LIKE (
        SELECT P.TEAM_ID
        FROM PLAYER P
        WHERE P.PLAYER_NAME LIKE '����'
)
;
SELECT X.PLAYER_NAME ������
    ,X.POSITION ������
    ,X.BACK_NO ��ѹ�
FROM PLAYER X JOIN (
        SELECT P.TEAM_ID
        FROM PLAYER P
        WHERE P.PLAYER_NAME LIKE '����') D
    ON X.TEAM_ID = D.TEAM_ID
;


-- SOCCER_SQL_022
-- NULL ó���� �־�
-- SUM(NVL(SAL,0)) �� ��������
-- NVL(SUM(SAL),0) ���� �ؾ� �ڿ����� �پ���

-- ���� �����Ǻ� �ο����� ���� ��ü �ο��� ���

-- Oracle, Simple Case Expr

SELECT
    TEAM_ID,
    NVL(SUM(CASE POSITION WHEN 'FW' THEN 1 ELSE 0 END),0) FW,
    NVL(SUM(CASE POSITION WHEN 'MF' THEN 1 ELSE 0 END),0) MF,
    NVL(SUM(CASE POSITION WHEN 'DF' THEN 1 ELSE 0 END),0) DF,
    NVL(SUM(CASE POSITION WHEN 'GK' THEN 1 ELSE 0 END),0) GK,
    COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID
;



-- SOCCER_SQL_023
-- GROUP BY �� ���� ��ü �������� �����Ǻ� ��� Ű �� ��ü ��� Ű ���S
SELECT
    ROUND(AVG(CASE WHEN POSITION LIKE 'MF' THEN HEIGHT END),2) �̵��ʴ�,
    ROUND(AVG(CASE WHEN POSITION LIKE 'FW' THEN HEIGHT END),2) ���ݼ�,
    ROUND(AVG(CASE WHEN POSITION LIKE 'DF' THEN HEIGHT END),2) �����,
    ROUND(AVG(CASE WHEN POSITION LIKE 'GK' THEN HEIGHT END),2) ��Ű��,
    ROUND(AVG(HEIGHT),2) "��ü ���Ű"
FROM PLAYER
;




-- SOCCER_SQL_024
-- �Ҽ����� Ű�� ���� ���� ������� ����

SELECT*
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT)
                            FROM PLAYER
                            GROUP BY TEAM_ID)
;

SELECT TEAM_ID, MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID
;


-- SOCCER_SQL_025
-- K-���� 2012�� 8�� ������� �� ������ �������� ABS �Լ��� ����Ͽ�
-- ���밪���� ����ϱ�

SELECT SCHE_DATE ��¥,
    CONCAT(CONCAT(T.TEAM_NAME,' - '),T2.TEAM_NAME)����,
    CONCAT(CONCAT(HOME_SCORE, ' - '),AWAY_SCORE) ����,
    ABS(HOME_SCORE-AWAY_SCORE)
    
FROM (SELECT SCHE_DATE, 
             HOME_SCORE, 
             AWAY_SCORE, 
             HOMETEAM_ID, 
             AWAYTEAM_ID
       FROM SCHEDULE
       WHERE SCHE_DATE BETWEEN 20120801 AND 20120831
       ) S 
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T
        ON S.HOMETEAM_ID LIKE T.TEAM_ID
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T2
        ON S.AWAYTEAM_ID LIKE T2.TEAM_ID
;
        




-- SOCCER_SQL_026
-- 20120501 ���� 20120602 ���̿� ��Ⱑ �ִ� ����� ��ȸ
SELECT 
    DISTINCT 
    STADIUM_ID ��Ÿ����ڵ�, 
    STADIUM_NAME ������
FROM (SELECT 
            STADIUM_ID, 
            STADIUM_NAME
      FROM STADIUM)
      JOIN (SELECT SCHE_DATE, STADIUM_ID
            FROM SCHEDULE
            WHERE SCHE_DATE 
                BETWEEN TO_DATE('20120501') AND TO_DATE('20120602'))
        USING(STADIUM_ID)
;

-- SOCCER_SQL_027
-- ���������� �ش� ������ ���� ���� ���Ű ��ȸ
-- ��, ���Ľ� ���Ű ��������
SELECT A.*,
       ROUND((SELECT AVG(X.HEIGHT)
              FROM PLAYER X
              WHERE X.TEAM_ID LIKE A.TID),2) ���Ű
FROM (SELECT 
        T.TEAM_ID TID,
        T.TEAM_NAME ����,
        P.PLAYER_NAME ������,
        P.HEIGHT Ű 
      FROM PLAYER P 
        JOIN TEAM T
           ON P.TEAM_ID LIKE T.TEAM_ID) A
ORDER BY 4 DESC
;


-- SOCCER_SQL_028
-- ���Ű�� �Ｚ ������� ���� ���Ű���� ���� ����
-- �̸��� �ش� ���� ���Ű
SELECT 
    T.TEAM_NAME ���̸�,
    ROUND(AVG(P.HEIGHT),2) ���Ű
FROM (SELECT TEAM_ID, HEIGHT
      FROM PLAYER) P
      JOIN (SELECT TEAM_ID, TEAM_NAME
      FROM TEAM) T
    ON P.TEAM_ID LIKE T.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING AVG(P.HEIGHT) <
        (SELECT AVG(HEIGHT)
        FROM (SELECT TEAM_ID, HEIGHT
             FROM PLAYER)
        JOIN (SELECT TEAM_ID, TEAM_NAME
             FROM TEAM
             WHERE TEAM_NAME LIKE '�Ｚ�������')
        USING(TEAM_ID))
;

-- SOCCER_SQL_029
-- �巡���� K07,FC���� K09,��ȭõ�� K08 ������ �� �Ҽ��� GK, MF ���� ����
SELECT *
FROM (SELECT TEAM_ID ,TEAM_NAME
      FROM TEAM
      WHERE TEAM_ID IN('K07','K09','K08')) T 
      JOIN(SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')) P
        ON T.TEAM_ID LIKE P.TEAM_ID
; -- COUNT 67

SELECT P.*, (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE P.TEAM_ID )
FROM (SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')
            AND TEAM_ID IN('K07','K09','K08')) P
; -- COUNT 67

-- SOCCER_SQL_030
-- 29������ ������ ���� �������� �ƴ� �������� ��

SELECT COUNT(*) �������Ǽ�
FROM PLAYER P 
    JOIN TEAM T
    USING(TEAM_ID)
WHERE TEAM_NAME NOT IN('�巡����','FC����','��ȭõ��')
            AND POSITION NOT IN('GK','MF')
;