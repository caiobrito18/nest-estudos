-- CreateTable
CREATE TABLE "Students" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "idade" TEXT NOT NULL,

    CONSTRAINT "Students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Classes" (
    "id" SERIAL NOT NULL,
    "private" BOOLEAN NOT NULL,
    "level" TEXT NOT NULL,
    "create_at" TIMESTAMP(3) NOT NULL,
    "update_at" TIMESTAMP(3) NOT NULL,
    "schedule" TEXT[],

    CONSTRAINT "Classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teachers" (
    "id" SERIAL NOT NULL,
    "user" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "field" TEXT NOT NULL,

    CONSTRAINT "Teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Content" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "teacherId" INTEGER NOT NULL,
    "link" TEXT NOT NULL,

    CONSTRAINT "Content_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CS_Relations" (
    "s_id" INTEGER NOT NULL,
    "c_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "CC_Relations" (
    "ct_id" INTEGER NOT NULL,
    "cl_id" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "CS_Relations_s_id_c_id_key" ON "CS_Relations"("s_id", "c_id");

-- CreateIndex
CREATE UNIQUE INDEX "CC_Relations_ct_id_cl_id_key" ON "CC_Relations"("ct_id", "cl_id");

-- AddForeignKey
ALTER TABLE "Content" ADD CONSTRAINT "Content_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "Teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CS_Relations" ADD CONSTRAINT "CS_Relations_s_id_fkey" FOREIGN KEY ("s_id") REFERENCES "Students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CS_Relations" ADD CONSTRAINT "CS_Relations_c_id_fkey" FOREIGN KEY ("c_id") REFERENCES "Classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CC_Relations" ADD CONSTRAINT "CC_Relations_ct_id_fkey" FOREIGN KEY ("ct_id") REFERENCES "Content"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CC_Relations" ADD CONSTRAINT "CC_Relations_cl_id_fkey" FOREIGN KEY ("cl_id") REFERENCES "Classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
