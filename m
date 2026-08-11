Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A51E1C860C;
	Tue, 11 Aug 2026 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424029; cv=none; b=CH17CptWFZrEz/Xb7eiWz8lLceNL4YQHt64UwRKGMYn65PA53F3BrFBrMfeuc47DwBHsnxJ2c8Hiht6313gxOh7qLjjQB1FPCc+PYczdLc2Z7ICCbgwvK+IhoyYznWXRXVCRiycEgdKNe8BA2Dl0uVs/chtY4k1WPvGQvZICsNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424029; c=relaxed/simple;
	bh=hcaZN39YyAlBtvXMpexzMl+KFui49iDa+rp5aTOG9DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GL8SKF4g45Jaz8dfZ9cLuNi1kle8sQq5mdGDno1/fDeVr0xEg7l+lFFgz3m9R8V4ZDobO84spNy+cCCQn1Yum6PIyd9D8fC766Qmq+YZIjTScKf02rObALs0YlqUjJLJ7sC1Sa6XS5XX2H3iYioeo9FnUe/tSjLBqyxuevDTD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JG2UDO6L; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JG2UDO6L"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AN1fBa2878875;
	Tue, 11 Aug 2026 04:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PAJjKu
	56zpacCW91YqMhQyApljutRfgRzjAv6T/Y+T0=; b=JG2UDO6LyJkRwo31YuHWCZ
	TQm9NVgEZXt/XzAyI5mmgMPFoVBeg0iT2dgVns1e0GgJxWnKSqg/0kBTxawu6rrW
	sokLhZITwgtDIC4Gt3mu/PvRJXTzfBcB8C1Wfj4e+TdroG3x7XX1/Zx8SeyttCoK
	Nxx0yh6hXHTRdpK/pxLUk0/EB/Npqa5S6ApsUfZ/31Xz80aqeTFElyQhBB64oP1u
	HbU0a3261OdZ1TD7yAbN2Z/DK009tkwgBve6y1jzSyA6mskaVVJPdDrYCGf1g0kP
	s0XuVYV63ba9g7NQT6Kcnnr/0bHvmom76PTyFOodwM2hQ0w2WuTZfdRuQgMECf3A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp2trmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 04:53:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67B4fNJl001394;
	Tue, 11 Aug 2026 04:53:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxf5vypev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 04:53:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67B4rWtC41091568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2026 04:53:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B42520043;
	Tue, 11 Aug 2026 04:53:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6065620040;
	Tue, 11 Aug 2026 04:53:29 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.82.57])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Aug 2026 04:53:28 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 0/8] gpio: move ppc4xx driver to drivers/gpio and modernize
Date: Tue, 11 Aug 2026 10:23:27 +0530
Message-ID: <178642395401.173296.6240959512279995942.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7aaacf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=ox7nXcRPhrGdTKcaXpQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: q7lZZzPadjxxapLSB2hsCB-wQ01vSUhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAzNSBTYWx0ZWRfXy6EEcelK+sbO
 hP15kFkXylRq7d7BwYWyDDNZa+nQCsOdvNmZBq4WWVd2xMKsjHl1S7H3hZf42ijW7hvtNucgzJo
 YqryvuXUQIIzSbmkmbo1l6UiguBIN1Fg4w0T+gy44M1t3bftQzq+aUGPs2bh+0ikoQPXgQL5xW8
 dPpW5BszonBB8591xSy+U0juf6+jTQY5Fyj1z1AqOqmOggW7e8aDscfanSZsQZ03mUQyGc/R0QP
 YjL0Rzx/7o8AF1RuE0yDbjfxe+pV5mrFZ473N8vOzOYEabxuE7LAO8VpXxkvfGA0OdUbTN0WG19
 tcPAvYdoRnDNPyXrVzHZQZvi19fq6PAAbzF2LydDcXT01pm45nKXCiVNKqiaSXaPBpUrnnxjRM2
 z36NVY3yIQGSBEFL+rPQelMqHowz1K+qb8BwwbQrkkmbEY1KFBDPeLM5SYG8JDFWVlabHez05NQ
 BcnSXaVRTrnRMGl5lbw==
X-Proofpoint-ORIG-GUID: QNhxVVKyTyLvm3fOQh7MM0pQS0V16Uy_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAzNSBTYWx0ZWRfX0aigZTRD5II/
 SC5Tqgsa4MKplNIo0HOb8Fd66I7RyfTvBCdWO08ts2gDjV/OXVTMinltJPuNgYbsmksdd/UaSAm
 zJLqso03+NRZ7X4HOQwyICimicJd004=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110035

On Mon, 03 Aug 2026 15:35:31 -0700, Rosen Penev wrote:
> This series moves the ppc4xx GPIO driver from arch/powerpc to
> drivers/gpio, converts it to be a proper platform driver using
> generic MMIO helpers, drops architecture-specific accessors, and
> prepares it for module build and COMPILE_TEST.
> 
> v2: use guard(), reorganize a bit for clarity.
> 
> [...]

Applied to powerpc/next.

[1/8] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
      https://git.kernel.org/powerpc/c/66da1ae19672a295507b0c66cd74231e5bf482a9
[2/8] gpio: ppc44x: update all 4xx to 44x
      https://git.kernel.org/powerpc/c/f9476e237ab351b840f99aadc865c0fc913b65f9
[3/8] gpio: ppc44x: Use module platform driver helper for GPIO
      https://git.kernel.org/powerpc/c/f17b0ef8593d2c9f38197c396146b63e918e46fc
[4/8] gpio: ppc44x: Use platform resource helper for GPIO MMIO
      https://git.kernel.org/powerpc/c/8ab2d98f635f77132c9fca4e3983c53729ef52cf
[5/8] gpio: ppc44x: Convert GPIO to generic MMIO
      https://git.kernel.org/powerpc/c/714d445a1c8eeefc3167a0e1a6dc766cbc162e40
[6/8] gpio: ppc44x: drop PPC-specific IO helpers
      https://git.kernel.org/powerpc/c/595f5f25a96adb4ffec89e973756161c30753276
[7/8] gpio: ppc44x: fix undefined behavior in GPIO_MASK2 macro
      https://git.kernel.org/powerpc/c/9c4d539d112fb32355a403513023f08bd17360bc
[8/8] gpio: ppc44x: use dev_name() for chip label
      https://git.kernel.org/powerpc/c/98a39710fc8d9c70fcf9bacbb0cc802b0c1a0bbe

cheers
