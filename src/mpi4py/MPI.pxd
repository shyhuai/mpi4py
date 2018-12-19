# Author:  Lisandro Dalcin
# Contact: dalcinl@gmail.com

# --

from mpi4py.libmpi cimport MPI_Aint
from mpi4py.libmpi cimport MPI_Offset
from mpi4py.libmpi cimport MPI_Count
from mpi4py.libmpi cimport MPI_Status
from mpi4py.libmpi cimport MPI_Datatype
from mpi4py.libmpi cimport MPI_Request
from mpi4py.libmpi cimport MPI_Message
from mpi4py.libmpi cimport MPI_Op
from mpi4py.libmpi cimport MPI_Group
from mpi4py.libmpi cimport MPI_Info
from mpi4py.libmpi cimport MPI_Errhandler
from mpi4py.libmpi cimport MPI_Comm
from mpi4py.libmpi cimport MPI_Win
from mpi4py.libmpi cimport MPI_File

# --

cdef import from *:
    ctypedef MPI_Aint   Aint   "MPI_Aint"
    ctypedef MPI_Offset Offset "MPI_Offset"
    ctypedef MPI_Count  Count  "MPI_Count"

ctypedef public api class Status [
    type   PyMPIStatus_Type,
    object PyMPIStatusObject,
    ]:
    cdef MPI_Status ob_mpi
    cdef unsigned   flags

ctypedef public api class Datatype [
    type   PyMPIDatatype_Type,
    object PyMPIDatatypeObject,
    ]:
    cdef MPI_Datatype ob_mpi
    cdef unsigned     flags

ctypedef public api class Request [
    type   PyMPIRequest_Type,
    object PyMPIRequestObject,
    ]:
    cdef MPI_Request ob_mpi
    cdef unsigned    flags
    cdef object      ob_buf

ctypedef public api class Prequest(Request) [
    type   PyMPIPrequest_Type,
    object PyMPIPrequestObject,
    ]:
    pass

ctypedef public api class Grequest(Request) [
    type   PyMPIGrequest_Type,
    object PyMPIGrequestObject,
    ]:
    cdef MPI_Request ob_grequest

ctypedef public api class Message [
    type   PyMPIMessage_Type,
    object PyMPIMessageObject,
    ]:
    cdef MPI_Message ob_mpi
    cdef unsigned    flags
    cdef object      ob_buf

ctypedef public api class Op [
    type   PyMPIOp_Type,
    object PyMPIOpObject,
    ]:
    cdef MPI_Op   ob_mpi
    cdef unsigned flags
    cdef object   (*ob_func)(object, object)
    cdef int      ob_usrid

ctypedef public api class Group [
    type   PyMPIGroup_Type,
    object PyMPIGroupObject,
    ]:
    cdef MPI_Group ob_mpi
    cdef unsigned  flags

ctypedef public api class Info [
    type   PyMPIInfo_Type,
    object PyMPIInfoObject,
    ]:
    cdef MPI_Info ob_mpi
    cdef unsigned flags

ctypedef public api class Errhandler [
    type   PyMPIErrhandler_Type,
    object PyMPIErrhandlerObject,
    ]:
    cdef MPI_Errhandler ob_mpi
    cdef unsigned       flags

ctypedef public api class Comm [
    type   PyMPIComm_Type,
    object PyMPICommObject,
    ]:
    cdef MPI_Comm ob_mpi
    cdef unsigned flags

ctypedef public api class Intracomm(Comm) [
    type   PyMPIIntracomm_Type,
    object PyMPIIntracommObject,
    ]:
    pass

ctypedef public api class Topocomm(Intracomm) [
    type   PyMPITopocomm_Type,
    object PyMPITopocommObject,
    ]:
    pass

ctypedef public api class Cartcomm(Topocomm) [
    type   PyMPICartcomm_Type,
    object PyMPICartcommObject,
    ]:
    pass

ctypedef public api class Graphcomm(Topocomm) [
    type   PyMPIGraphcomm_Type,
    object PyMPIGraphcommObject,
    ]:
    pass

ctypedef public api class Distgraphcomm(Topocomm) [
    type   PyMPIDistgraphcomm_Type,
    object PyMPIDistgraphcommObject,
    ]:
    pass

ctypedef public api class Intercomm(Comm) [
    type   PyMPIIntercomm_Type,
    object PyMPIIntercommObject,
    ]:
    pass

ctypedef public api class Win [
    type   PyMPIWin_Type,
    object PyMPIWinObject,
    ]:
    cdef MPI_Win  ob_mpi
    cdef unsigned flags
    cdef object   ob_mem

ctypedef public api class File [
    type   PyMPIFile_Type,
    object PyMPIFileObject,
    ]:
    cdef MPI_File ob_mpi
    cdef unsigned flags


cdef import from "mpi-ext.h" nogil:

    int MPIX_Comm_revoke(MPI_Comm comm)
    int MPIX_Comm_shrink(MPI_Comm comm, MPI_Comm *newcomm)
    int MPIX_Comm_failure_ack(MPI_Comm comm)
    int MPIX_Comm_failure_get_acked(MPI_Comm comm, MPI_Group *failedgrp)
    int MPIX_Comm_agree(MPI_Comm comm, int *flag)
    int MPIX_Comm_iagree(MPI_Comm comm, int *flag, MPI_Request *request)
# -
