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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(20),
    size integer,
    hasblackhole boolean,
    numstars_bln numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_planet_km integer,
    composition text,
    hasatmosphere text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_type character varying(20),
    object_id integer NOT NULL,
    descripton text,
    isverified boolean,
    source character varying(40),
    name character varying(30)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_year text,
    has_water boolean,
    has_life boolean,
    radius_km numeric,
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    temperature_in_k integer,
    mass_kg_10_to_power_30 numeric,
    issupernova boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000, true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1200000, true, 400);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 500000, false, 25);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 70000, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 80000, false, 1.5);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 90000, true, 1.2);
INSERT INTO public.galaxy VALUES (7, 'Bode_s Gallaxy', 'Spiral', 60000, false, 0.9);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 384400, 'Silicate, Metal', 'None');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 9378, 'Carbonaceous', 'None');
INSERT INTO public.moon VALUES (3, 3, 'Ganimede', 1070412, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (4, 5, 'Triton', 354800, 'Water Ice, Nitrogen', 'thin');
INSERT INTO public.moon VALUES (5, 3, 'Io', 421700, 'Sulfur, Rock', 'thin');
INSERT INTO public.moon VALUES (6, 3, 'Europa', 671100, 'Water Ice, Silicate', 'thin');
INSERT INTO public.moon VALUES (7, 4, 'Titan', 1221930, 'Nitrogen, Methane', 'thick');
INSERT INTO public.moon VALUES (8, 4, 'Enceladus', 238040, 'Water Ice, Organic Compounds', 'thin');
INSERT INTO public.moon VALUES (9, 4, 'Phoebe', 12952000, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (10, 9, 'Charon', 17536, 'Water Ice', 'thin');
INSERT INTO public.moon VALUES (11, 2, 'Deimos', 23460, 'Carbonaceous', 'None');
INSERT INTO public.moon VALUES (12, 4, 'Hyperion', 1481100, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (13, 4, 'Mimas', 185520, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (14, 3, 'Callisto', 1882700, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (15, 4, 'Rhea', 527040, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (16, 6, 'Miranda', 129390, 'Ice, Rock', 'None');
INSERT INTO public.moon VALUES (17, 4, 'Tethys', 294660, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (18, 8, 'Oberon', 583520, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (19, 4, 'Iapetus', 3560820, 'Water Ice, Rock', 'None');
INSERT INTO public.moon VALUES (20, 7, 'Lysithea', 11718300, 'Irregular', 'None');


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'galaxy', 1, 'The Milky Way is our home galaxy.', true, 'NASA', NULL);
INSERT INTO public.more_info VALUES (2, 'star', 1, 'The sun is the center of our solar system.', true, 'ESA', NULL);
INSERT INTO public.more_info VALUES (3, 'planet', 1, 'Earth is the third planet from the Sun.', true, 'Wikipedia', NULL);
INSERT INTO public.more_info VALUES (4, 'moon', 1, 'The Moon is Earth''s only natural satellite.', true, 'NASA', NULL);
INSERT INTO public.more_info VALUES (5, 'galaxy', 2, 'Andromeda is the nearest spiral galaxy to the Milky Way.', true, 'Hubble Space Telescope', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', '0 AD', true, true, 6371, 'Nitrogen,Oxygen');
INSERT INTO public.planet VALUES (3, 3, 'Jupiter', '1610', false, false, 69911, 'Hydrogen,Hellium');
INSERT INTO public.planet VALUES (4, 4, 'Saturn', 'Ancient times', false, false, 58232, 'Hydrogen,Hellium');
INSERT INTO public.planet VALUES (2, 2, 'Mars', '1659', false, false, 3389.5, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (5, 5, 'Neptune', '1846', false, false, 24622, 'Hydrogen,Hellium');
INSERT INTO public.planet VALUES (6, 1, 'Mercury', 'Ancient times', false, false, 2439.7, 'None');
INSERT INTO public.planet VALUES (7, 1, 'Venus', 'Ancient times', false, false, 6051.8, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (8, 5, 'Uranus', '1781', false, false, 25362, 'Hydrogen, Hellium');
INSERT INTO public.planet VALUES (9, 2, 'Pluto', '1930', false, false, 1187, 'Nitrogen, Methane');
INSERT INTO public.planet VALUES (10, 8, 'Kepler-186f', '2014', true, true, 2831.5, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (11, 6, 'Proxima Centauri b', '2016', true, true, 8302, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (12, 2, 'Eris', '2005', false, false, 1163, 'Nitrogen, Methane');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 5778, 1.989, false);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 5790, 1.1, false);
INSERT INTO public.star VALUES (3, 2, 'Betelgeuse', 3500, 11.6, false);
INSERT INTO public.star VALUES (4, 1, 'Sirius', 9940, 2.02, false);
INSERT INTO public.star VALUES (5, 1, 'Vega', 9602, 2.36, false);
INSERT INTO public.star VALUES (6, 1, 'Proxima Centauri', 3042, 0.123, false);
INSERT INTO public.star VALUES (7, 2, 'Antares', 3590, 12.4, false);
INSERT INTO public.star VALUES (8, 6, 'Pollux', 4820, 1.86, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

