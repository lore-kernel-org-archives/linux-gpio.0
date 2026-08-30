Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3A39E6CD
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079274; cv=none; b=pG77zms6eCUuNOZzPPyQvRpZxRfz7Fep+A0RqCgv2Tfe4BEsCm7uzouKzSoOww9Cwd5ca0g34k2J+aXnfRLm7OAidCjqMjsM55pR8EVQfy6IPxBHsgwachCZDtP1mOCs/L1Xi6pGkTxffk2IW0cX6ZcSm/7y1xyUSGavCGpchg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079274; c=relaxed/simple;
	bh=P5YoXmwsa6Ehsg4LISy8/Uhe1DYRHh5p2rSm5w6dsRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFDwGCnupxb+kepPEPHhl0ikXXm3qPdcw1miuu4tS5y6DGMSIjYO/c+7fhozvcojFcl3nbjD9BVcsQTmvw8frJ0MkKscIQ/C5gAmhgJXIXfbUp63djmIyXQX/wsJ8CnyAO8T+MjFSY5HDNVnQhvuGywML6JG1Y2U4CHYLKJ/PSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CF2eUxT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8trKw8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CF2eUxT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8trKw8k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U5vxsr177618
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 08:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQ
	pagIPDFc=; b=CF2eUxT0WnCj4NZ1wqq7WVGWb0D3x2ATm7Krtj2NVh2ofx7rH3K
	FTQx3ShfQMHhEnVbGvQpzK5tjpvfrXQrlQ/jfT3emizbVX7PL0MSrrW082874aTo
	eBdtKmzNp4c5kSLyql+Pb7cB0U+jdkbwcwrj+8otgJrrZjoSz2Kn5mat3emslTSb
	/Gps/mJGBAH+OJhzD33F9nCR8l6ird0D9A9+j2YVC2YQZg0Ar4441qmEVVQtzhl7
	2WLdf4FFy8km0PsXmdtywUb9QhRukgb6bHp09AHc7Z0JtjdPkR8RbdZGcqBTU3Xk
	dLgcfYK/zQm+vv/kszlEbm8pqrwJ850peHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvjn8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 08:41:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so60340811cf.1
        for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788079271; x=1788684071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQpagIPDFc=;
        b=L8trKw8kAaCYnNXgKy5cDJaLu5iD6H3t2R5wp1z7Ruu3BRUOOsEWRde7acHGmRvg6x
         TWsfu7BLAUyCGx7RS2Hl84Y6mN5rmGRvpVIB/g6OXV0Bv7Q6nID4o2nuR9MBBOj5jYqz
         1t/8j/uGB77LrFVhGf3TvxZ+X4dlXLrJrmqZM6dsWvmPoWxOHuyc3BBPW6ZGstgmj5Gx
         CeH51MlZ49N+HpJjgOKtuOGiVdS67VIjQsfGtPr4H+Q1+qSckkObnhPuBG5UhLIn1BuE
         tKr0+eLVi+n21N3W8zGltO4NJNgY40IUxi65BOwjehtDydXig73dO/h3r5UbmOfiOKQX
         Ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788079271; x=1788684071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQpagIPDFc=;
        b=NcFdXg1qdGKLB6+S4m+KkvCtgMaspKru8q9LIm4PxJTVL5rTXDRxR9TMfwxJy+vanz
         JV7P3JHGvcWd+JE97FBLhIK1W//eiDCri3sINoMDruBo2aoseeE7Fr0AuFsrJYm+2Urb
         VHbdZKLBkNiDkvU2l284qqurKc9kooj94gTmd8h+eHOZNOwlz0HKluEXJ1Qsr7ysVE9L
         F9SUjDoJeYOpq87K45xHeDewtk78Va132aD4pUiIFIIYvVCRgpNsXET5AbVeR00LOEHt
         SyeA3GtkMxR5UAYwAbOWZHcvwG+jxRN1cGT2e7Ic2c/7WN12y8pBxwBwiNP44poDtQrl
         Q1KA==
X-Forwarded-Encrypted: i=1; AHgh+RqPxzzfzY7DtH5LbQ2EUJ0ttvgEudyyfP2ku3JhQNWshh14KVkjl4PcHSXSejBH6tjjz8f47DN0IYIH@vger.kernel.org
X-Gm-Message-State: AFuF++mb3WXYK0YmMgQVTSyCO26AFFMOmSPYVYUj3Tn9CeQr4Iyo2of6
	Ojh4hi3F0y6OWePIw61NmkUjwuDwIosFHLS0Vnj3V2304cIgh8AWZzrTzp7EHV9fEnD5idz6LZX
	tXuRxeewBEEdskghqFBXxSDj3S2P4bSR/Yrc81x9CXNl6tP/kw7hHZ7exf7xaHfFW
X-Gm-Gg: AR+sD11+PRUGa4l4m14be9t7iBnqmytYVufZrTRmOyQhHLh5euF6wGNzEDQTvh5O0eA
	/NRmsebjflsIrq+y+BSnBB4OXi/7sJCpKzyJhuIp7+HSH+HwgRoDZoPZLKBal61AkCYOjgIMEea
	Px01GDVGvSmMHWxRN3wjCpOe7FRKJ/rplOpr60doUXdt6AmJzDx0A33dPqpMvNjGBYLG4Om7Ein
	bwGEWFO6Yh+2hBD2J4t1kVXgdGkz6WvVo7TuCFsCmT/AZ1o+zKfESSb3PhHuPOOYePwmrQTX6VC
	pJXsvlDwrIieyqTu+6HFm7YMQcSNfbI1ynKfyPR9v/yR+DzLco6Jy52pSrk438U16TQ/Ve0odhH
	cZ6AljPc5TFRhYBM=
X-Received: by 2002:a05:622a:1486:b0:52d:8256:ac33 with SMTP id d75a77b69052e-52fb95f4fb5mr214250281cf.28.1788079271270;
        Sun, 30 Aug 2026 01:41:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1486:b0:52d:8256:ac33 with SMTP id d75a77b69052e-52fb95f4fb5mr214249981cf.28.1788079270793;
        Sun, 30 Aug 2026 01:41:10 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm56071755e9.3.2026.08.30.01.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:41:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Date: Sun, 30 Aug 2026 10:41:05 +0200
Message-ID: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P5YoXmwsa6Ehsg4LISy8/Uhe1DYRHh5p2rSm5w6dsRM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqk+ygy4zLzP+8gDUARwqQa2XhorzTcQB/ozd5X
 31/KrTlkKCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapPsoAAKCRDBN2bmhouD
 16bVD/91ny6FEEHEyeL16IBP1y6/zQD9jvfwVq/7MoXDsPW9dlRIpoHdWs1QXBY1MDsh1rbXBBU
 HwzUs3JCVRH0T21eYZnlddeMyfmUTZfIIhiPnbOGOdO1skhlwLvbhRGMbDdwvme7aXBxqbl0lu3
 h4mPQn/7KxDqJLS+dP/H0siwnVi9N8zGuavRt6wgDMjR4SnakDdNVVjQMAvv9LPagFOv/zGRwRt
 YxqKO6hgNAWK1F/4p04Mk+CzE9kxGQIddiG7zZSWgNZdTQab2BwrBFnNHEj/qznoVoNnVeWofXs
 jjdwTvoM0yZtqKF/d3zRcPeXK7cw/kDgy38BpECaq49OtzU3I+lBfYvGhcJc2G1b/NUbepBhq23
 nvhXVdVHnYmOWkvq11he1prYLSS0ojLbR9n8a1wwMZ8zgPFhr73LFFpELZIiOO3z6nDbBd7Voai
 bOnSt+0Iqbn68tbl+2u6qfxsIRFXdFcup5jNormWTb1vronNxNHz7nkcWVXgxp2rFoNzllXCS1s
 DoUyqMY79zx5I8GOjt24uoFCTzygTALMe07i/s81J3bXGqr6LCkyTUMafXBlHr2Q1dM3BOiJaJc
 aw/bBV/+Z2zw0qc66nqFPfthvtwJJtXFGrRK/zDDICBr/6EaZY/tlgMlVaHTtPJ/GAWIs7FSEL4 2tx44dk/5FVA9zw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hzdnrGoGJxHSXrYhL7Vev_oYLSk_DDex
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a93eca7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4PiMN3fzvG74CLbEUuQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX9CPwbGzeOi14
 nQQqc7vrQGg0jMMqnIYkS+FD+Qj7vMyL18QeGDdpUMVcNourwNOui9p1h7xU7eH6cWIAANXEK7u
 Ub1xQZLDhSbhI1qtWf2pm1zNFmsfST6ETLjZfPt4jKCNvi+Sn+R4hudyiohbWE42kd7TTHrR6Cj
 ukwfNh62ADo87Isg1g8VAJs+L4Q92QuKnlJe1kIOCXK3gA+TKYKwyllMNsPUCnbq/NDPm3YpoFb
 voknEoGPL3ejdC+XzX9z4114Jh1ygoZMQN0JlFqc9Wi59fpBW4uVWtQr2vQi2b+GgNRK6PFKWjp
 irl0PskG3wSQeoXSULEnwJuVUmdxuM/fyLnDtTTm57FC1Ittl9k1Nvaji20lPqtvzNO/5xdflhH
 zcZcZDkVzjIhj6i/dTNdlmdAlKbAuggxbz3pPyiPXU40ZImXiutjmG4qaX4mmJ38VNvvuRhx26p
 Vk08PkO27bPDFgw8rvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfXxwB8ZwswgTrv
 O2AAmTGJfRGxvrXDDeiS0TSHvlFyhrUBW9b2F7a8hY4hdrgBKmMzKw+9ADFmT9p2DKXhnBT7IWX
 9YeumPERKY2Y02fMwmyEldHl/gTRlBA=
X-Proofpoint-ORIG-GUID: hzdnrGoGJxHSXrYhL7Vev_oYLSk_DDex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300071

YAML files do not use tabs, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Correct logic in commit msg spaces->tabs
---
 .../devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml    | 8 ++++----
 .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml     | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml        | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml        | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
index 846e110062b2..0a69ed9880e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
@@ -179,7 +179,7 @@ examples:
 
         pinctrl_uart4: uart4grp {
             fsl,pins =
-                <0x288 0x658 0x000 0x3 0x0	0x140>,
-                <0x28c 0x65c 0x938 0x3 0x3	0x140>;
+                <0x288 0x658 0x000 0x3 0x0 0x140>,
+                <0x28c 0x65c 0x938 0x3 0x3 0x140>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 7bd723ab1281..948160cfbc5f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -95,8 +95,8 @@ examples:
 
       pinctrl_uart5: uart5grp {
         fsl,pins =
-          <0x0160 0x03D0 0x0714 0x1 0x0	0x7e>,
-          <0x0164 0x03D4 0x0000 0x1 0x0	0x76>;
+          <0x0160 0x03D0 0x0714 0x1 0x0 0x7e>,
+          <0x0164 0x03D4 0x0000 0x1 0x0 0x76>;
       };
     };
   - |
@@ -107,7 +107,7 @@ examples:
 
       pinctrl_gpio_lpsr: gpio1-grp {
           fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
+            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
index 6068be11dfe2..2341633943c7 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
@@ -82,8 +82,8 @@ examples:
 
         pinctrl_uart2: uart2grp {
             fsl,pins =
-                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
-                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
+                <0x23C 0x4A4 0x4FC 0x0 0x0 0x140>,
+                <0x240 0x4A8 0x000 0x0 0x0 0x140>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
index 7dcf681271d3..dc86bf6e580f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
@@ -74,8 +74,8 @@ examples:
 
         pinctrl_lpuart5: lpuart5grp {
             fsl,pins =
-                <0x0138 0x08F0 0x4 0x3	0x3>,
-                <0x013C 0x08EC 0x4 0x3	0x3>;
+                <0x0138 0x08F0 0x4 0x3 0x3>,
+                <0x013C 0x08EC 0x4 0x3 0x3>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
index 96e7b6995273..333b2e7fdaac 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
@@ -78,8 +78,8 @@ examples:
 
         pinctrl_uart3: uart3grp {
             fsl,pins =
-                <0x48 0x1f8 0x41c 0x1 0x0	0x49>,
-                <0x4c 0x1fc 0x418 0x1 0x0	0x49>;
+                <0x48 0x1f8 0x41c 0x1 0x0 0x49>,
+                <0x4c 0x1fc 0x418 0x1 0x0 0x49>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
index db5fe66ad873..854fbcd8e78a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -73,7 +73,7 @@ examples:
 
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
-              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
+              <0x0EC 0x2DC 0x000 0x2 0x0 0xf1>,
+              <0x0F0 0x2E0 0x000 0x2 0x0 0xf1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
index 2e880b3e537c..988db9507543 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
@@ -71,7 +71,7 @@ examples:
         reg = <0x400e8000 0x4000>;
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
-              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
+              <0x16C 0x3B0 0x620 0x0 0x0 0xf1>,
+              <0x170 0x3B4 0x61C 0x0 0x0 0xf1>;
         };
     };
-- 
2.53.0

