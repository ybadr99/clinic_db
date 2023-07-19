CREATE TABLE patients (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR(255) NOT NULL,
      date_of_birth DATE 
);

CREATE TABLE medical_histories (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      admit_at DATE NOT NULL,
      patient_id INTEGER ,
      status VARCHAR(255) NOT NULL,

      FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      total_amount DECIMAL(10,2),
      generated_at DATE NOT NULL,
      payed_at DATE NOT NULL,
      medical_history_id INTEGER NOT NULL,

      FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      type  VARCHAR(255) NOT NULL,
      name  VARCHAR(255) NOT NULL
);

CREATE TABLE invoices_items (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      unit_price DECIMAL(10,2),
      quantity INTEGER NOT NULL,
      total_price DECIMAL(10,2),
      invoice_id INTEGER NOT NULL,
      treatment_id INTEGER NOT NULL,


      FOREIGN KEY(invoice_id) REFERENCES invoices(id),
      FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);