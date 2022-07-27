--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 184, 185, 4, 2, 2018, 'Final');
INSERT INTO public.games VALUES (66, 186, 187, 2, 0, 2018, 'Third Place');
INSERT INTO public.games VALUES (67, 185, 187, 2, 1, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (68, 184, 186, 1, 0, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (69, 185, 188, 3, 2, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (70, 187, 189, 2, 0, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (71, 186, 190, 2, 1, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (72, 184, 191, 2, 0, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (73, 187, 192, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (74, 189, 193, 1, 0, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (75, 186, 194, 3, 2, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (76, 190, 195, 2, 0, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (77, 185, 196, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (78, 188, 197, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (79, 191, 198, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (80, 184, 199, 4, 3, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (81, 200, 199, 1, 0, 2014, 'Final');
INSERT INTO public.games VALUES (82, 201, 190, 3, 0, 2014, 'Third Place');
INSERT INTO public.games VALUES (83, 199, 201, 1, 0, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (84, 200, 190, 7, 1, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (85, 201, 202, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (86, 199, 186, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (87, 190, 192, 2, 1, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (88, 200, 184, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (89, 190, 203, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (90, 192, 191, 2, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (91, 184, 204, 2, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (92, 200, 205, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (93, 201, 195, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (94, 202, 206, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (95, 199, 193, 1, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (96, 186, 207, 2, 1, 2014, 'Eighth-Final');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (184, 'France');
INSERT INTO public.teams VALUES (185, 'Croatia');
INSERT INTO public.teams VALUES (186, 'Belgium');
INSERT INTO public.teams VALUES (187, 'England');
INSERT INTO public.teams VALUES (188, 'Russia');
INSERT INTO public.teams VALUES (189, 'Sweden');
INSERT INTO public.teams VALUES (190, 'Brazil');
INSERT INTO public.teams VALUES (191, 'Uruguay');
INSERT INTO public.teams VALUES (192, 'Colombia');
INSERT INTO public.teams VALUES (193, 'Switzerland');
INSERT INTO public.teams VALUES (194, 'Japan');
INSERT INTO public.teams VALUES (195, 'Mexico');
INSERT INTO public.teams VALUES (196, 'Denmark');
INSERT INTO public.teams VALUES (197, 'Spain');
INSERT INTO public.teams VALUES (198, 'Portugal');
INSERT INTO public.teams VALUES (199, 'Argentina');
INSERT INTO public.teams VALUES (200, 'Germany');
INSERT INTO public.teams VALUES (201, 'Netherlands');
INSERT INTO public.teams VALUES (202, 'Costa Rica');
INSERT INTO public.teams VALUES (203, 'Chile');
INSERT INTO public.teams VALUES (204, 'Nigeria');
INSERT INTO public.teams VALUES (205, 'Algeria');
INSERT INTO public.teams VALUES (206, 'Greece');
INSERT INTO public.teams VALUES (207, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 207, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

