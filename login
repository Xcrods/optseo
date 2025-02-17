import { useState } from 'react'
import { Button } from "/components/ui/button"
import { Input } from "/components/ui/input"
import { Label } from "/components/ui/label"
import { Phone, Check } from "lucide-react"

export default function LoginForm() {
  const [phoneNumber, setPhoneNumber] = useState('')
  const [otp, setOtp] = useState('')
  const [otpSent, setOtpSent] = useState(false)

  const handlePhoneNumberChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPhoneNumber(e.target.value)
  }

  const handleOtpChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setOtp(e.target.value)
  }

  const sendOtp = () => {
    // Simulate sending OTP
    console.log(`Sending OTP to ${phoneNumber}`)
    setOtpSent(true)
  }

  const verifyOtp = () => {
    // Simulate OTP verification
    console.log(`Verifying OTP: ${otp}`)
    alert('OTP Verified! Proceed to Onboarding.')
  }

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-white">
      <div className="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 className="text-2xl font-bold mb-6">Login</h2>
        {!otpSent ? (
          <>
            <div className="mb-4">
              <Label htmlFor="phone-number" className="block text-sm font-medium text-gray-700">
                Phone Number
              </Label>
              <div className="mt-1 relative rounded-md shadow-sm">
                <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <Phone className="h-5 w-5 text-gray-400" aria-hidden="true" />
                </div>
                <Input
                  type="tel"
                  id="phone-number"
                  className="pl-10"
                  value={phoneNumber}
                  onChange={handlePhoneNumberChange}
                  placeholder="Enter your phone number"
                />
              </div>
            </div>
            <Button onClick={sendOtp} className="w-full">
              Send OTP
            </Button>
          </>
        ) : (
          <>
            <div className="mb-4">
              <Label htmlFor="otp" className="block text-sm font-medium text-gray-700">
                OTP
              </Label>
              <div className="mt-1 relative rounded-md shadow-sm">
                <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <Check className="h-5 w-5 text-gray-400" aria-hidden="true" />
                </div>
                <Input
                  type="text"
                  id="otp"
                  className="pl-10"
                  value={otp}
                  onChange={handleOtpChange}
                  placeholder="Enter OTP"
                />
              </div>
            </div>
            <Button onClick={verifyOtp} className="w-full">
              Verify OTP
            </Button>
          </>
        )}
      </div>
    </div>
  )
}
