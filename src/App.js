import React, { useEffect, useState } from 'react';
import axios from 'axios';
import {
  Box,
  Container,
  Heading,
  Text,
  VStack,
  HStack,
  Link,
  IconButton,
  Avatar,
  useColorMode,
  useColorModeValue,
  Flex,
  Spacer,
  Button,
  Image,
  Tag,
  TagLabel,
} from '@chakra-ui/react';
import { FaLinkedin, FaGithub, FaMoon, FaSun, FaStar, FaCodeBranch } from 'react-icons/fa';
import { VerticalTimeline, VerticalTimelineElement } from 'react-vertical-timeline-component';
import 'react-vertical-timeline-component/style.min.css';

const experiences = [
  {
    company: 'Nixplay',
    position: 'Lead Flutter Developer',
    duration: '2023 - Current',
    description: 'Led development of Nixplay mobile app using Flutter. Collaborated with cross-functional teams.',
    logo: '/logos/nixplay.jpeg',
  },
  {
    company: 'Skipr',
    position: 'Flutter Developer',
    duration: '2021 - 2023',
    description: 'Developed mobility management solution for businesses using Flutter. Worked closely with clients.',
    logo: '/logos/skipr.jpeg',
  },
  {
    company: 'Beeple',
    position: 'Medior Mobile Developer',
    duration: '2017 - 2021',
    description: 'Migrated from Xamarin to Flutter. Led mobile development team for SaaS web application.',
    logo: '/logos/beeple.jpeg',
  },
  {
    company: 'Project assistant',
    position: 'Mobile Developer',
    duration: '2016 - 2017',
    description: 'Worked on iOS development projects: Swoop and MyTuition Score. Utilized Firebase backend.',
    logo: '/logos/projectassistant.jpeg',
  },
];

const repos = [
  'Sadoge/watchlist',
  'Sadoge/weather',
];

const App = () => {
  const { colorMode, toggleColorMode } = useColorMode();
  const [projects, setProjects] = useState([]);

  useEffect(() => {
    const fetchRepos = async () => {
      const repoData = await Promise.all(repos.map(async (repo) => {
        const { data } = await axios.get(`https://api.github.com/repos/${repo}`);
        return {
          name: data.name,
          description: data.description,
          stars: data.stargazers_count,
          forks: data.forks_count,
          language: data.language,
          updated: new Date(data.updated_at).toLocaleDateString(),
          link: data.html_url,
        };
      }));
      setProjects(repoData);
    };

    fetchRepos();
  }, []);

  const bg = useColorModeValue('light.background', 'dark.background');
  const color = useColorModeValue('light.text', 'dark.text');
  const cardBg = useColorModeValue('light.card', 'dark.card');
  const timelineContentBg = useColorModeValue('#ffffff', '#2D3748');
  const timelineTextColor = useColorModeValue('#333333', '#f5f5f5');

  return (
    <Box minH="100vh" bg={bg} color={color}>
      <Container maxW="container.lg" p={4}>
        <Flex align="center" mb={8}>
          <Heading as="h1" size="xl" bgGradient="linear(to-l, #a97a56, #8b6344)" bgClip="text">
            Sam Smets
          </Heading>
          <Spacer />
          <HStack spacing={4}>
            <IconButton
              icon={colorMode === 'light' ? <FaMoon /> : <FaSun />}
              onClick={toggleColorMode}
              colorScheme="brand"
            />
            <Link href="https://github.com" isExternal>
              <IconButton icon={<FaGithub />} colorScheme="brand" />
            </Link>
            <Link href="https://linkedin.com" isExternal>
              <IconButton icon={<FaLinkedin />} colorScheme="brand" />
            </Link>
          </HStack>
        </Flex>

        <VStack align="start" spacing={8}>
          <Box w="100%" bg={cardBg} p={6} borderRadius="md" shadow="md">
            <HStack align="start" spacing={8}>
              <Box flex="1">
                <Text fontSize="3xl" fontWeight="bold" mb={4} bgGradient="linear(to-l, #a97a56, #8b6344)" bgClip="text">
                  Crafting Seamless Cross-Platform Experiences with Flutter
                </Text>
                <Text fontSize="lg" mb={4}>
                  I'm a dedicated software developer specializing in Flutter. I transform ideas into engaging, high-quality mobile applications that provide exceptional user experiences. Let's work together to bring your vision to life.
                </Text>
                <Button colorScheme="brand" mt={4} onClick={() => window.open('resume.pdf', '_blank')}>
                  Download Resume
                </Button>
              </Box>
              <Avatar
                size="2xl"
                name="Sam Smets"
                src="/sam.jpeg"
              />
            </HStack>
          </Box>

          <Box w="100%" bg={cardBg} p={6} borderRadius="md" shadow="md">
            <Heading as="h2" size="xl" mb={4} bgGradient="linear(to-l, #a97a56, #8b6344)" bgClip="text">
              Experience
            </Heading>
            <VerticalTimeline>
              {experiences.map((exp, index) => (
                <VerticalTimelineElement
                  key={index}
                  contentStyle={{ background: timelineContentBg, color: timelineTextColor }}
                  contentArrowStyle={{ borderRight: `7px solid ${colorMode === 'light' ? '#a97a56' : '#a97a56'}` }}
                  date={exp.duration}
                  iconStyle={{ background: '#a97a56', color: '#ffffff' }}
                  icon={<Image src={exp.logo} alt={`${exp.company} logo`} borderRadius="full" />}
                >
                  <HStack spacing={4}>
                    <Box>
                      <Heading as="h3" size="md" color={timelineTextColor}>{exp.position}</Heading>
                      <Text fontSize="sm" color={colorMode === 'light' ? 'gray.500' : 'gray.300'}>{exp.company}</Text>
                      <Text mt={2} color={timelineTextColor}>{exp.description}</Text>
                    </Box>
                  </HStack>
                </VerticalTimelineElement>
              ))}
            </VerticalTimeline>
          </Box>

          <Box w="100%" bg={cardBg} p={6} borderRadius="md" shadow="md">
            <Heading as="h2" size="xl" mb={4} bgGradient="linear(to-l, #a97a56, #8b6344)" bgClip="text">
              My GitHub Repositories
            </Heading>
            <VStack align="start" spacing={4}>
              {projects.map((project, index) => (
                <Box key={index} w="100%" bg={cardBg} p={4} borderRadius="md" shadow="md">
                  <HStack justify="space-between">
                    <Link href={project.link} isExternal>
                      <Heading as="h3" size="md">{project.name}</Heading>
                    </Link>
                    <HStack>
                      <HStack spacing={1}>
                        <FaStar color="gold" />
                        <Text>{project.stars}</Text>
                      </HStack>
                      <HStack spacing={1}>
                        <FaCodeBranch />
                        <Text>{project.forks}</Text>
                      </HStack>
                    </HStack>
                  </HStack>
                  <Text fontSize="sm" color={colorMode === 'light' ? 'gray.500' : 'gray.300'} mt={2}>{project.description}</Text>
                  <HStack spacing={2} mt={4}>
                    <Tag size="sm" colorScheme="teal">
                      <TagLabel>{project.language}</TagLabel>
                    </Tag>
                    <Text fontSize="xs" color={colorMode === 'light' ? 'gray.500' : 'gray.300'}>{project.updated}</Text>
                  </HStack>
                </Box>
              ))}
            </VStack>
          </Box>
        </VStack>
      </Container>
    </Box>
  );
};

export default App;
