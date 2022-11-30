# Importa módulos necessários
# Imports the required modules
from rdkit import Chem
from rdkit.Chem.ChemUtils import SDFToCSV

# Cria Gerenciador de contexto para o arquivo 'data_pubchem.csv'.
# Creates de Context Manager for the file 'data_pubchem.csv'.
with open('data_pubchem.csv', 'w') as file:
    # Associa a variável 'molecules' ao leitor de arquivos SDF.
    # Associates the variable's value to the SDF reader.
    molecules = Chem.SDMolSupplier(
        r"C:\Users\mathe\Downloads\Compound_000000001_000500000.sdf\Compound_000000001_000500000.sdf"
    )

    # Faz a conversão do arquivo SDF em CSV.
    # Converts the SDF file into a CSV file.
    SDFToCSV.Convert(molecules, file)
