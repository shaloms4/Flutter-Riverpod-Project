class JobDescription {
  final String name;
  final String title;
  final String description;
  final String phoneNumber;
  final int startingSalary;
  final String address;

  JobDescription({
    required this.name,
    required this.title,
    required this.description,
    required this.phoneNumber,
    required this.startingSalary,
    required this.address,
  });
}
final List<JobDescription> jobDescriptions = [
  JobDescription(
    name: 'John Doe',
    title: 'Software Developer',
    description: 'Responsible for developing software applications.',
    phoneNumber: '0976543214',
    startingSalary: 30000,
    address: 'Addis Ababa, Arat Kilo',
  ),
  JobDescription(
    name: 'Jane Smith',
    title: 'Data Scientist',
    description: 'Responsible for analyzing and interpreting complex data.',
    phoneNumber: '0967343223',
    startingSalary: 25000,
    address: 'Addis Ababa, Piassa',
  ),
  JobDescription(
    name: 'Alice Johnson',
    title: 'UX Designer',
    description: 'Responsible for creating user-friendly interfaces.',
    phoneNumber: '0976567687',
    startingSalary: 35000,
    address: 'Addis Ababa, Bole',
  ),
  JobDescription(
    name: 'Jeneze Clark',
    title: 'Graphics Designer',
    description: 'Responsible for producing visual concepts to communicate ideas.',
    phoneNumber: '0952721892',
    startingSalary: 40000,
    address: 'Addis Ababa, Mekanisa',
  ),
  
];
