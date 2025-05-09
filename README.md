# Multi-Agent AI in Civil Engineering

A sophisticated multi-agent AI system that leverages GPT-4o to generate comprehensive civil engineering foundation reports from raw site data. The system utilizes Neo4j-based knowledge graphs for efficient data extraction and management.

## 🌟 Project Overview

This project revolutionizes civil engineering workflows by:

- Converting unstructured PDF reports into structured knowledge graphs
- Enabling semantic search and reasoning over civil engineering data
- Coordinating multiple AI agents for smooth report generation
- Implementing real-time version control for collaborative work
- Enhancing efficiency, accuracy, and data-driven decision-making

## 🏗️ System Architecture

The system consists of three main components:

1. **PDF2Graph**: Extracts text from PDF documents and constructs knowledge graphs
2. **Neo4j Graph Storage**: Manages multiple knowledge graphs for different documents
3. **Multi-Agent System**: Coordinates specialized agents for information retrieval and report generation

## 📋 Repository Structure

```
├── notebooks/
│   ├── PDF2Graph.ipynb          # PDF processing and knowledge graph construction
│   ├── Neo4jGraphAgentSetup.ipynb  # Multi-agent setup and query system
├── agents/
│   ├── kg_agent.py              # Knowledge graph interaction agent
│   ├── comparison_agent.py      # Data comparison agent
├── data/
│   ├── sample_reports/          # Sample civil engineering reports
├── results/
│   ├── QA1/                     # Question-answering results set 1  
│   ├── QA2/                     # Question-answering results set 2
├── utils/
│   ├── pdf_processing.py        # PDF handling utilities
│   ├── neo4j_utils.py           # Neo4j connection utilities
├── docker/
│   ├── neo4j_setup.sh           # Neo4j Docker setup scripts
├── README.md                    # Project documentation
└── requirements.txt             # Dependencies
```

## 🚀 Key Features

- **PDF Processing**: Automated extraction of text from complex civil engineering PDFs
- **Knowledge Graph Construction**: Creation of property graphs with over 4,000 nodes
- **Multi-Graph Management**: Support for multiple Neo4j instances and knowledge graphs
- **Semantic Search**: Vector-based and graph traversal retrieval mechanisms
- **Multi-Agent Coordination**: Specialized agents that collaborate on report generation
- **Comparative Analysis**: Tools for comparing information across multiple reports

## 🔧 Technical Implementation

### PDF2Graph Component

The PDF2Graph component automates the extraction of information from PDF documents into knowledge graphs:

1. **PDF Splitting**: Divides large PDFs into manageable chunks
2. **Text Extraction**: Uses LlamaParse to extract structured text
3. **Knowledge Graph Construction**: Constructs property graphs using both:
   - ImplicitPathExtractor
   - SimpleLLMPathExtractor

### Neo4j Graph Management

The system supports multiple Neo4j instances to store various knowledge graphs:

- **Containerized Deployment**: Docker-based Neo4j instances with custom configurations
- **Graph Store Management**: Custom `MultiGraphStore` class for managing multiple graphs
- **APOC Plugin Integration**: Enhanced graph functionality through Neo4j APOC

### Multi-Agent System

The multi-agent system coordinates specialized agents:

- **Vector Context Retriever**: Combines vector search with graph traversal
- **Custom Retriever**: Enhances retrieval with custom logic
- **Function-Calling Agent**: Orchestrates tool usage and response generation
- **Comparison Agent**: Specialized in comparing information across documents

## 📊 Sample Results

The system has been successfully tested on civil engineering foundation reports, demonstrating its ability to:

- Extract technical parameters from complex engineering documents
- Answer domain-specific questions about soil conditions, foundation requirements, etc.
- Compare information across multiple reports to identify similarities and differences
- Generate comprehensive foundation analyses based on raw site data

## 🛠️ Setup and Installation

### Prerequisites

- Python 3.8+
- Docker
- Neo4j 5.26.1+
- OpenAI API key

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/multi-agent-civil-engineering.git
   cd multi-agent-civil-engineering
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set up Neo4j Docker containers:
   ```bash
   cd docker
   ./neo4j_setup.sh
   ```

4. Configure environment variables:
   ```bash
   export OPENAI_API_KEY="your-api-key"
   export LLAMA_CLOUD_API_KEY="your-llama-api-key"
   ```

5. Run the notebooks in sequence:
   - First run `PDF2Graph.ipynb` to process PDFs and create knowledge graphs
   - Then run `Neo4jGraphAgentSetup.ipynb` to set up the agent system

## 🤝 Contributing

Contributions to improve the system are welcome. Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Team

This project was developed at the University of Missouri-Kansas City (ongoing, May 2025).

## 📞 Contact

For questions or collaborations, please contact cxnnd@umkc.edu.
