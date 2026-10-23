Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749866;
	b=RqjZjzElc/OPSKsljB817or1uVmIi8IkuPvlS1fXCtB5Y9zTAikHICvxDCliH/oxK5PR
	 zOt+P5akYOdJjCLiObLQwpu+mKjXejumigy9Nsi06JcatQNIDmBBPBOKneRCKy5BZljw8
	 oxpFnLI0q428YoOTAG+dD1gEScb253B+GD7eZDAxwdCHGltnZ0Ql6jNeHRDnPo5RmM+64
	 oetdajq/RlzJZxOmvmBqiXFimdSZu0piFe4D29SrVvgJQ1lL3BhQs0SuhCyHKyVwB7bUT
	 QFwbkaLbavoiilB9aQLYp3ASSS/LXiLHkc3a4q2kl3FHq7gyxS1SQ4rOTLcXl4djeeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rPNZaLdkkDt1o78Pvu0zSFP4BwW8dB3JIJw/7AcaPlw=;
	b=YePadwk4dG8zuM6Qb9OEM/MZBoJrtY05Cv/ibJhUQkAWhUws/qJXg3iEXv6UrjPbw7Qh
	 N2qUDzfw4J89HTTO1N8HrIADLPddiYDGrgeqZFkEgSBxCyfzE+mh96b2FXdWsux8iVZhz
	 xkKQjUDFq67YzJhEIc0K2RGPm/nQznE1O2Z4kQlXyctwhJ0tVYNvLQXNYBzK41NvEFQVt
	 cn+lRlQBo6ycpIFDZEuilH0veL4AO9zIDhFuEO5B7k1NG1TGeG5yWw1aODJyY1bLTDZK5
	 85d1gXY6e/GLNZOQHiB3f5Cbd8WVPQOS71lD01QebVD6/Y800wEtd4cz0Kqbv2IXDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey3Pt6hh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMNeeuXC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285060A2606
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5285060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey3Pt6hh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMNeeuXC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FHmI2112706
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rPNZaLdkkDt1o78Pvu0zSF
	P4BwW8dB3JIJw/7AcaPlw=; b=Ey3Pt6hhiw6BE/9jzX4ufYcD95HmJHppCp9nAr
	T6btxOXRrK33nzXFLBRftVbvs0lj04cdStbFthZ9N9FL4daE0SjkEAG1B2SSFscF
	/zidHT/NV6axHduln71HPlKYI+NP2JN50O487eN/QSqO1DbF9BbYi8CA5cYPoFa0
	zpmVPoBEhLpoC2POnvCBmYOysI19FJ/1S9yAh3Evbu+5iJEkDyZCzqfJc08wux+A
	U3CbHB1Mw8RLtyRsWLtsrBvByG8OPrErIkbwX0gqt2cJh7UvvD1qO/x1lhULy+3y
	HGM7ggKdrr9DOdrjUX6kN8FqTmPYdZ63/70Ld0raeSVuLPGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykajev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:04:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so161850185a.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749864; x=1793354664; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rPNZaLdkkDt1o78Pvu0zSFP4BwW8dB3JIJw/7AcaPlw=;
        b=aMNeeuXCjMd+BL9/phinQ+GoHZPC1rYv71d0OjVkumc0X7VMTZ7f8BocZxsS1Xe57m
         C6PSjzEphQhcKLub1BvvdsV5IQ3uoW2tuJ1DLNNZ+am2/EMglLiq/Lj4FaPRuwvneFyr
         GCi01qsZTNLuuSlPSGyI+7fe5H1NAOC8cVbuw9ynS0yzqymUoxqEEcb0epvHF1YjXdoR
         se5pysBfpNVoCHhrrLQIx6nkrPbd/9D4EPUbs1yUofdkLvWzGZngSS/DurIHJ1dGpay6
         2SngFXx3yPxA9hmfc/bdHIEbj4Q/hAGvAbQUR+tCeAQ0CY7SU5OKyVc7ekiTl5ur9RvG
         cy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749864; x=1793354664;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rPNZaLdkkDt1o78Pvu0zSFP4BwW8dB3JIJw/7AcaPlw=;
        b=cWRGWYBr5wUmtfzZjI9C+0KTWTCtgkFtAPpubhxejph6kw71JNhN8ZJUscIJq6p+K3
         vn419YcsS5Y8BXijpJAbHu9YmgxUcnUsBe1BFnytWN5FMPmf+lCZDPJXFaLLEJzALoV+
         XswuqU/DVuZlRqkPOsbSpYXdn5pknf6OdjRKJi9AwT8BhQ2j4z0n9gz/9mDGl48L5q47
         /b3yLl1iWo4uWC+jp+NTyQpjuC/7QgHwa1f2BW8xjd6Wmsf6DY7ijC7Ml++rp7Q8S3mj
         mXcYxAUptc/A65wLCJvse3wA/yvpx8in5pVLqHGxuCFEEIBkQQknRcOECrmyJ0AmPmm0
         ftmQ==
X-Gm-Message-State: AFq9FYLbM6YBbBlG22DO1SUg5697fy5FXBus9pOvMgyGjSLuR6Xf/rRY
	53Hqbbk54X1SuPQsBFbLq647B/h0ki2KxMbAbysA4EDbWdsNzkRYqsK3fpd90nlC87DABKlsNvl
	QHGjYoeJpg+0VZhSxKk5wcGwD7DxEfEKWY9XayB35s6em1ULirfhNFWRcd+Tox+7C
X-Gm-Gg: AYBFou2Rdzl1ZbVYFkbAIl/vajdpYK9BD+l6DcwYWyW9syLcQjyY2xPbL68Hg6xuU6h
	7yMBMXZujHFkclaLTIdPmdABC0Y73Ttu68C2OywPZbO8F3l1BkkaZTrfFpQqhi0q4nbCkPrQl8P
	p5Z6RkIMFD45HZ4bil+8rBYZJ+YAJDEVuljkv5hY2PV9S2r7J+BXrH7mgkQIuz4y6dtoAR80p6h
	dj2JFtyHJozlh6VNC2cKJEJ5DJjMkhIFMgA5cOIgNmiVqHIYFUy1j9cbQO1vqin237YQdRpyJE6
	4SKJEmEk7Bg5IjfQ0gN/l8LYZfKqhZwqsZvwsPFp7JIQ+52pZF7ZHxQIwH0pNK0SAQ0gyHqvmOB
	JWbHMqBTor5yfjwNHzb41GbZghTtp
X-Received: by 2002:a05:620a:45ac:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f6f787274mr328394285a.25.1792749864247;
        Fri, 23 Oct 2026 03:04:24 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f6f787274mr328390185a.25.1792749863694;
        Fri, 23 Oct 2026 03:04:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21555f9e1sm13111535e9.4.2026.10.23.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:04:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:04:19 +0200
Subject: [PATCH libgpiod v2] build: restore function and header checks in
 meson build
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-meson-func-hdr-checks-v2-1-439b13a52368@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACIx22oC/3WNzQ6CMBCEX4Xs2SVt+RE9+R6GA5SFboQWWyEaw
 rvbEK9eJvkymW82COSZAlyTDTytHNjZCOqUgDaNHQi5iwxKqFIKpXCi4Cz2i9VoOo/akH4ELNq
 y0k3eXFRRQdzOnnp+H947jNwOM7sO6tgYDi/nP8fhKo/+587+uFeJEvtzXoksy0lIdXMhpM+lG
 bWbpjQG1Pu+fwFsmK+eywAAAA==
X-Change-ID: 20261022-meson-func-hdr-checks-5b68ca4a9258
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3749;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VIrdNOvJhfd4pxD0STmzshO+fofZG7SH1uuDAE0U/Mg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zElr6TqgnPjzUDJRGzNJLKvja7QR21X4m4HK
 6dLqxl6SYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsxJQAKCRAFnS7L/zaE
 w8eIEACsLe9kMRMhA4qdvUTfOKKRwZveHwho9NVZcCFmAif6dRu/D24cCuB7mUdWFKBo7EsRjA/
 piQBj2nCENc2BE9ipUMpVfSS/eoQC/sK7D58KicEaYFnvU8C1pGqx8hHdjO1BUq3QuXzevjw/gg
 kwK0DVFK6cHx72wMrP6Z8NivHFcn28qVZOz9gXkceSZqrUqEcNIn9nAV0s9BCjB9jQ9n3UoKzw8
 VJN9C24002HDoHHkkTvJ2V9uQjo2ykQwWRr+ee32+P1w30qAVvFLwI7Xag1sW5CfanaNyDE9mj2
 XQ9+3jQW6O74fTPW0Mn/aKhuqtw0m07Imxr/AklcR3DvBdu2CGGsfhJClcvK8GaHcoMveM0qF7r
 gK2XONKqYbq+YYw1N7zyTWvQKhFgyd5cY5bmWww70le/n5asjfw9+plJKWuiRoiyrvomAIKoVYn
 aDFC+N13ms+onTMT+r/cs6aXC0pXBLYTxRPsoLDvm+E1mR6VKb8KFKUuYg7kxOVUs2pifuc51Jt
 YjG122aEYiaCGTXsBRCcMNtWaOuvFoXUVeclhU9kFBndcRm2lHZMZ16PSYhIHUNNS+8yt7+BHMZ
 nrlNmV6Th4Z7w+gu++8htr6IuAHxPj9ac6y+Z6qaPqL/aS9L6N63M6Z9M+AWbuF1SiHcc2DKUVI
 tY4aH9OeQ5W7VzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3eD90r5xv1xV
 dK5zgE/on5YZtdvIFx8cvp/EkPa62CG1VsRdkTS5RyysuNBhF5EoEObgqDOa/M9SThFFq8sjKxR
 oY3HauTop7+5e+ToOolV+O2GAw2Vg97579LK97C1Ym1mm+gMNvNMq93vPvT/QodCgr9yEA5XXd2
 gIVbk3ZJ2ld05VV6lAluFoUlukflwYYUQDHYrTU19Oj9yEWpfsit71lQ+t2oO6LKKTrS6BZVepq
 DBS/XYJDbw+eHiHPYvsi5AqSr+Tr76hfkNG2ZJB32SAW+u1rRxuzEXiafoSSsQA6ZG3Sp/W1lSx
 PfF+wNvdbUMyAoDwPjSyAnW2awVVDbyEo8xZxXhOpiGIfsn99uSH395pGpUdKGaUyJ3TuaUseOl
 vhZ1L6mCXD2GzI/Vu1lEMC5TBiYojGIcDivz/yaPyPeKFSdvLsI23Im8tiJUyFyf6g0c4/3e74R
 1NhBcwSG/eJuBmdCcAA==
X-Proofpoint-ORIG-GUID: XwmFUJN4-9pZO-oggRgWt0rcdcJll5hV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX+zsg9K/ebB1g
 l2aTyE1pSm+A6CDcAASlWmomLSmG1MUe3B95Dk/G+KDTpszuLhxJeg1fuhWNfFxTlXq5y++BBIP
 zykcljQ4DXfIzXoQhCWw0878+DgMqf0=
X-Proofpoint-GUID: XwmFUJN4-9pZO-oggRgWt0rcdcJll5hV
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb3129 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=MnWH6L30y1vDSSXWxzIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

The conversion from autotools to meson dropped the AC_CHECK_FUNC() and
AC_CHECK_HEADERS() checks from configure.ac. As a result, a missing libc
function or header is no longer caught at configuration time and instead
shows up as an obscure compilation or linking error later on.

Bring the checks back using compiler.has_function() and
compiler.check_header(). Keep the same grouping as before: library
checks are always done, tools, tests and D-Bus daemon checks only when
the respective component is enabled. The pthread library check is not
restored as it's already covered by the threads dependency.

_GNU_SOURCE needs to be passed explicitly as project arguments are not
used by the compiler checks.

Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Bump minimum meson version as compiler.has_function() was first
  introduced in v1.3.0
- Link to v1: https://patch.msgid.link/20261023-meson-func-hdr-checks-v1-1-f7480334e012@oss.qualcomm.com
---
 meson.build | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 7045d29f5fac049d67ef50627712e338643ecff0..b70098b8aaab7a52311a09662bfbd605a6521f0c 100644
--- a/meson.build
+++ b/meson.build
@@ -9,7 +9,7 @@ project('libgpiod', 'c',
     'cpp_std=gnu++17',
     'warning_level=2',
   ],
-  meson_version: '>= 0.64.0',
+  meson_version: '>= 1.3.0',
 )
 
 extra_version = '+devel'
@@ -182,6 +182,92 @@ endif
 
 help2man = find_program('help2man', required: false)
 
+cc = meson.get_compiler('c')
+
+lib_headers = [
+  'fcntl.h',
+  'getopt.h',
+  'dirent.h',
+  'poll.h',
+  'sys/sysmacros.h',
+  'sys/ioctl.h',
+  'sys/param.h',
+  'sys/stat.h',
+  'sys/types.h',
+  'linux/const.h',
+  'linux/ioctl.h',
+  'linux/types.h',
+]
+lib_funcs = {
+  'ioctl': 'sys/ioctl.h',
+  'open': 'fcntl.h',
+  'close': 'unistd.h',
+  'read': 'unistd.h',
+  'ppoll': 'poll.h',
+  'realpath': 'stdlib.h',
+  'readlink': 'unistd.h',
+}
+
+tools_funcs = {
+  'daemon': 'unistd.h',
+  'asprintf': 'stdio.h',
+  'scandir': 'dirent.h',
+  'versionsort': 'dirent.h',
+  'strtoull': 'stdlib.h',
+  'nanosleep': 'time.h',
+}
+
+tests_headers = [
+  'sys/utsname.h',
+  'sys/mount.h',
+  'sys/prctl.h',
+  'sys/random.h',
+  'linux/version.h',
+  'pthread.h',
+]
+tests_funcs = {
+  'atexit': 'stdlib.h',
+  'asprintf': 'stdio.h',
+  'prctl': 'sys/prctl.h',
+  'unlink': 'unistd.h',
+  'unlinkat': 'unistd.h',
+  'openat': 'fcntl.h',
+  'mkdirat': 'sys/stat.h',
+  'write': 'unistd.h',
+  'twalk': 'search.h',
+  'tsearch': 'search.h',
+  'tdestroy': 'search.h',
+  'tdelete': 'search.h',
+  'setrlimit': 'sys/resource.h',
+}
+
+dbus_funcs = {
+  'daemon': 'unistd.h',
+  'strverscmp': 'string.h',
+}
+
+check_headers = lib_headers
+check_funcs = lib_funcs
+if opt_tools.allowed()
+  check_funcs += tools_funcs
+endif
+if tests_enabled
+  check_headers += tests_headers
+  check_funcs += tests_funcs
+endif
+if dbus_enabled
+  check_funcs += dbus_funcs
+endif
+
+foreach hdr : check_headers
+  cc.check_header(hdr, args: '-D_GNU_SOURCE', required: true)
+endforeach
+
+foreach func, hdr : check_funcs
+  cc.has_function(func, prefix: '#include <@0@>'.format(hdr),
+                  args: '-D_GNU_SOURCE', required: true)
+endforeach
+
 subdir('include')
 subdir('lib')
 

---
base-commit: c2e9287333d7be588b3acaed7bbb1c58d7b551be
change-id: 20261022-meson-func-hdr-checks-5b68ca4a9258

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

