import { useState } from "react";
import { Link } from "react-router-dom";

export default function Reports() {
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");
  const [reportType, setReportType] = useState("attendance");

  return (
    <div className="min-h-screen bg-slate-100 p-6">
      <div className="mx-auto max-w-6xl">
        <Link
          to="/admin"
          className="mb-6 inline-block text-blue-600 hover:underline"
        >
          ← Back to Admin Dashboard
        </Link>

        <div className="rounded-2xl bg-white p-6 shadow-sm sm:p-8">
          <h1 className="text-2xl font-bold text-slate-800">
            Attendance Reports
          </h1>
          <p className="mt-2 text-slate-500">
            Generate attendance reports for your selected date range.
          </p>

          <div className="mt-6 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
            <div>
              <label
                htmlFor="reportType"
                className="mb-2 block text-sm font-medium text-slate-700"
              >
                Report Type
              </label>
              <select
                id="reportType"
                value={reportType}
                onChange={(e) => setReportType(e.target.value)}
                className="w-full rounded-lg border border-slate-300 px-4 py-3"
              >
                <option value="attendance">Attendance Summary</option>
                <option value="student">Student-wise Report</option>
                <option value="employee">Employee Report</option>
              </select>
            </div>

            <div>
              <label
                htmlFor="startDate"
                className="mb-2 block text-sm font-medium text-slate-700"
              >
                From Date
              </label>
              <input
                id="startDate"
                type="date"
                value={startDate}
                max={endDate || undefined}
                onChange={(e) => setStartDate(e.target.value)}
                className="w-full rounded-lg border border-slate-300 px-4 py-3"
              />
            </div>

            <div>
              <label
                htmlFor="endDate"
                className="mb-2 block text-sm font-medium text-slate-700"
              >
                To Date
              </label>
              <input
                id="endDate"
                type="date"
                value={endDate}
                min={startDate || undefined}
                onChange={(e) => setEndDate(e.target.value)}
                className="w-full rounded-lg border border-slate-300 px-4 py-3"
              />
            </div>
          </div>

          <button
            type="button"
            onClick={() =>
              alert(
                "Report filters selected. Connecting report data to your existing database is the next step."
              )
            }
            className="mt-6 rounded-lg bg-blue-600 px-6 py-3 font-semibold text-white hover:bg-blue-700"
          >
            Generate Report
          </button>

          <div className="mt-8 rounded-xl border border-dashed border-slate-300 bg-slate-50 p-8 text-center">
            <div className="text-4xl">📊</div>
            <h2 className="mt-3 text-lg font-semibold text-slate-800">
              Report Results
            </h2>
            <p className="mt-2 text-sm text-slate-500">
              Your actual report records and attendance statistics will appear
              here after the database connection is added.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}