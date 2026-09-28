class ComplexNumber{
public double real;
public double imag;
public double abs;
public double angle;

	public ComplexNumber(){
		real  = 0.0;
		imag  = 0.0;
		abs   = 0.0;
		angle = 0.0;
	}
	
	public ComplexNumber(double real, double imag){
		this.real  = real;
		this.imag  = imag;
		this.abs   = Math.sqrt(real*real + imag*imag);
		this.angle = java.lang.Math.atan2((double)imag,(double)real) * 180.0/java.lang.Math.PI;
	}
	
	public void setReal(double real){
		this.real = real;
		this.abs   = Math.sqrt(real*real + imag*imag);
		this.angle = java.lang.Math.atan2((double)imag,(double)real) * 180.0/java.lang.Math.PI;
	}	
	
	public void setImag(double imag){
		this.imag = imag;
		this.abs   = Math.sqrt(real*real + imag*imag);
		this.angle = java.lang.Math.atan2((double)imag,(double)real) * 180.0/java.lang.Math.PI;
	}	

	public void setRealImag(double real, double imag){
		this.real  = real;
		this.imag  = imag;
		this.abs   = Math.sqrt(real*real + imag*imag);
		this.angle = java.lang.Math.atan2((double)imag,(double)real) * 180.0/java.lang.Math.PI;
	}
	
	public double getReal(){
		return real;
	}
	
	public double getImag(){
		return imag;
	}
	
	public double getAbs(){
		return abs;
	}
	
	public double getAngle(){
		return angle;
	}
}