﻿//  Author:     Jovan Popovic. 
//  This source file is free software, available under MIT license .
//  This source file is distributed in the hope that it will be useful, but
//  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
using System;
using System.Data.Common;
using System.Threading.Tasks;

namespace Belgrade.SqlClient
{
    /// <summary>
    /// Executes SQL query and provides DataReader to callback function.
    /// </summary>
    public interface IQueryMapper
    {
        /// <summary>
        /// Executes sql command and provides each row to the callback function.
        /// </summary>
        /// <param name="command">SQL command that will be executed.</param>
        /// <param name="callback">Callback function that will be called for each row.</param>
        /// <returns>Task</returns>
        Task ExecuteReader(DbCommand command, Action<DbDataReader> callback);

        /// <summary>
        /// Executes sql command and provides each row to the async callback function.
        /// </summary>
        /// <param name="command">SQL command that will be executed.</param>
        /// <param name="callback">Async callback function that will be called for each row.</param>
        /// <returns>Task</returns>
        Task ExecuteReader(DbCommand command, Func<DbDataReader, Task> callback);

    }
}