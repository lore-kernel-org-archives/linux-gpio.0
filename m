Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E123F1AA1
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858260; cv=none; b=ZKKYVreS/Exh3rPv/am6rsftogU9eK239oR0lXdKnHr6kqhDNrw19HfRL4MCcLHyXol8kgXoqp0q32f375Vn1v04TKPnpDFTPDkvtcO/XXvP4T7icH5gvNVW5oCihFcc0gWzD9SIBQbOlfE4BM5Wtq6r6lE5AHKZXW2fciWyH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858260; c=relaxed/simple;
	bh=G0T7v0NGQCep0tYQ5RGX+RdRnjPxnE0Ezf6nZRSWdkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afaaW9Kgv/E9lesYzMq5ypFY3/143SiujpYi/MyGy5QUaObIdDxdOVHzsG8QL2Biz99DqJd/1RSroLjd0aVdIxd0U8aaxp6UUU6qEH9w4nB1bm/IgesMRApYwIEEixmL57qXGuqjR2ziO2/GOwtLb91/DbUokVv+U9hUzvtlgvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dcxe/lhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEkFftqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dcxe/lhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEkFftqL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CInle1933325
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 12:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PTHT1dheQJsqmvQxcTjAL8IiAzeG839D4TE
	Oz3WnF30=; b=Dcxe/lhVEXfDmqZ+GxXnMia1hgNc3oMIhBvLrBdzD/kCy1t0oW3
	cOte80RA+Le69gjbx56y0G0hzSNEhxBLZMZ9j3/NFzRhabgVxIxBw2hNozrKbDBO
	fyc44pQr+/Jlgc7tdfb6ijRcRNcgPmKj/KhhBZ87BeEl2WQD5cg/wQ6wqKqQOi5d
	cbSAsCmw3EIsI/kyWdIUyh5y5VcHvf9jZzIRjup/5BeuiHClFFDY2fxaRfPVY8Qk
	6Dcp2AleyOzeqeRJY4I9khoo/jvJAHnlR+xsoV3OYL++Nbd28FjYuuq9uS1b0keN
	KrD3GybzVZu7RhubuCpuD52SOhatn31E/Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfsgyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:37:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso62484185a.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858257; x=1791463057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTHT1dheQJsqmvQxcTjAL8IiAzeG839D4TEOz3WnF30=;
        b=QEkFftqL+asCVojOrG2xKB5cB3UlrS2qSjoMIDcdFDaohM0HWxddAsutFbpr4mdtKx
         A6urK9BmiiPUMMctmEJAFd1Ch+nXXtnL/6fsm7npZdpVSC53KxuIdWEBDfY7eLjLdN86
         SDFt/dufObJfJ2zlgs7cq8YyrlRBtenpRw5n7n/3/vR2fqdYDbhcFHhA6qFvZWhnQK5O
         ToT9JeOHaZd9MkMamxrgLamPa2koiCpfv8mjMnHXUxvpBv2W0V9MepIrQ382SoTDapeK
         BnzqSLEqyf+CjBYOCrgnt/NQS62hmsxvYU8xtijx/eJp2KYx5ZFJnz6H8XnskXWtlk8r
         OdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858257; x=1791463057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTHT1dheQJsqmvQxcTjAL8IiAzeG839D4TEOz3WnF30=;
        b=tBw12BdUjzGciqMkz/2VHOCkn9SzIrnsnkdEqqu/sBSA49YTmv+nBztdKQu3mN8OCK
         3dKLTjet9RaaqNCOcROLjWKxc2eTdrpZj2J+box+sfjH/L/4C1fsjo5uqHrN3orHzp0l
         vUFGVuPPcZtaGChGQ97eUeQXt+3iinPi2RYYu51msDR16WQ5Bxm1Y13dc/RO0IaUAmqy
         2rJP2JccXtOJNlaextmKZzwJCZA23yxB5mVK3hLV+Wx5LZ74krXHlaZmY4kCE3SYqj8Q
         iLR/sGH25+IYwXqiqDM2qbaDW/UhHE9LfNyAcBOLp6cKu6xgB47D1x1OruuOrlwW04s9
         XJGw==
X-Forwarded-Encrypted: i=1; AKwUvBwfmZvgKCugC9LT1VHAtRVdMbE4g7diXN+Bd7XXd+n6g31DXr1wt9WzW6LBcqBpqZnXCxRW3LOGDF+0@vger.kernel.org
X-Gm-Message-State: AFuF++lEEijxlGfZN4hSEVNf4IvBSJnZLAGQlMrwI1KQSdqJc2lCffGr
	GGfgDAhXx9QMhGnGOJ91NjFs46Vy8vQIjL4s1Hw7W9ti7GRRt4sHZxNrTaufnvlYmOIdBOe4Bkm
	GRDZPStOrXkZH6BQoGvQdDB+NAIG/XOb6ctH7aUiOzugAQYZ/S9qIzkv+TOorAbyh
X-Gm-Gg: AYBFou1WXJjSwNqsDYK74Jqr2zTf9SQpaefVahYdVn4mh0Eb/o6Yp2r5sWmZxwqWDjs
	Az0wX4I6/t6YZOk1xTeM1tlR4ldEJZB3BU8P0oiL9ULGxnt2xFDdCuSJXF+oSh/kb/MntiXx6nq
	QWKC6CUtx4i0QtX/6BIf46yzwnbVEGsHi2dbm6xB7yPT8hpU7FHV9mGQvGf57oWQt7Z6x1FQ9uz
	g3zvchZ/U0DxV4jbLAkon31UjF/izPga3wuBdGD8pgeDAtW6rssSPAz8lLQ6VxOnpELHs9+5SVf
	G/sBdGcd0ijbH63cTFp83e/uLNKzSCThLLkRJru91mmon2a0OpMrFSqQmFOq+aAz82fwCgdYnGj
	W4MkXhvcKFNHcG8891aPNRLoSUaQ=
X-Received: by 2002:a05:620a:2248:20b0:937:6832:1f04 with SMTP id af79cd13be357-93ca97ac711mr642771685a.34.1790858257360;
        Thu, 01 Oct 2026 05:37:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:20b0:937:6832:1f04 with SMTP id af79cd13be357-93ca97ac711mr642767885a.34.1790858256870;
        Thu, 01 Oct 2026 05:37:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f952931sm72978865e9.13.2026.10.01.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:37:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control entry
Date: Thu,  1 Oct 2026 14:37:30 +0200
Message-ID: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXxreR4WkjzUwD
 wcV/IklmTrYv4vGj5yT/jwzu0e2Sjpn5zjHdzvILUv8pt0yGogXCq4zxyu/oezK5Jds78ogo/MI
 lGMnnDW5YLCYIMIHzoxdeordWAPyhfc=
X-Proofpoint-GUID: Qa0y3r7rCfuFMM5noiV-q_K-heQ-XwcJ
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe5411 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Uv8RpmJdD8qY1DzGu6gA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Qa0y3r7rCfuFMM5noiV-q_K-heQ-XwcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXwwdN2btbnq40
 amreFa2CK2l0l6H/Ok3a1QTr4Rm8XutdOym+82lusDgI/zZgtEE2tmwhkKmzgTD9RoxVBrOm3mX
 OGFUTwVxIo3IRxRsEOqmwBSvg6M0dnJch3Ajhx7c/Fhbi6Fl65Xk2CFYM57KU0r76JmsvoMzhxa
 JfLRAebWIvw3Deaxf76q68Vu9tzVj7hc5LyF1JZYCMmYccEeYtIKXHQcn4/Z5ZVa0p64o6knPWo
 27cg8osDKH9PhmigSOMj9svR7WBg3iGG8o5uHiEozn4pMGThTgPTfKLs+d7YVpRawMF4T/AdZFi
 v92PHg5ItAyKSbaYBZ7N2k45rNl6E9wJ9UsMVdVodhZwC0HSYiORqptDF/3xN6QkkyLPasdZ7Cq
 xvtG4NeLXp3vALCbL2ZoGrbJuhkyDS3Y2izzacthyY77kx3lIs8NTjEPhh8hS+VTArKDPERA7Pw
 7zF3bwld6mvnd2pJI1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

I stage Qualcomm pin control changes in my own tree before sending them
upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30c1cdd0fb385..ba74661971ce2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22985,6 +22985,7 @@ QUALCOMM PINCTRL DRIVERS
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml
 F:	drivers/pinctrl/qcom/
 
-- 
2.47.3

