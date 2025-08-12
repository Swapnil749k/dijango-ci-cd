FROM python:3.12

WORKDIR /data

# Copy dependencies list first for caching
COPY requirements.txt ./

# Install dependencies (including setuptools for Python 3.13 distutils support)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project
COPY . .

# Run migrations at container startup instead of build time (optional)
# If you still want them at build time, uncomment:
# RUN python manage.py migrate

EXPOSE 8000

# Start the Django dev server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
