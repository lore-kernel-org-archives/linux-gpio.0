Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E834AAC64
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577382; cv=none; b=P0lk6sp56bPH2Q2tw/zxIyzzPFFNNEEHW/JRGOF54AydbzjTAVODxCTOwk3sTVLzmwAMgdEa+fvcVcPJCBoQgqQRg5+gTzyIReEx6MyEKqh5V+rl1VPwQ1D4Qvd7stOFykCWNfS/cXQEr6ZSTg5NyH7Lttx0q53yr5zooxTscq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577382; c=relaxed/simple;
	bh=847pePPeKL7uHd9YGMZHq3smJLOkGI6J7KYStUxPw9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=StYEzNzSXpUUtIbpduQWXyedQdE10YVj7F4TnxSbyu6BpKHc1ZJZPgZVVw/VCGhTKwZtWQVHOYbmXVhbnnzY6H/gJ0ImFav3bPSYlcs4Mq1ZczY9f7pHLqHU+nTceJKeYB+5JdQzQHpiCZm/rcyx1EsyAYYDz5rdbeSHngYGPOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnZqYq7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQRe4bw0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnZqYq7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQRe4bw0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFe2q82430453
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DvnQpYF089Czf+M9+lZyiT
	ORdDIxzErjRe/LtBtTsn4=; b=MnZqYq7c9SlbULz+AlQRNagrazonEz71+lKhol
	LtSfiqS7F51Zpj1UjvLXJlk5l2QCzbLTgCKlPHIvDr9nA5vhKCbKHPOUMXHgp3zL
	rP/IjtdG5co1KkUiAAFYlrumSGOZ5J2qk++DDoR/k+6ID2yUshwYQSZx5ixJ6ge0
	YZ2yht/bRagZXthABi+35PUTZYnC4mk/AwNiJTujNUwHO/u69WzjNIvNMvsPjcoN
	wDCKSAyEQZ+No+qkw8Jbs3zmlHEj36TJPa30hKlh8CyY0jJAWIDhOW6lFxtAaRQF
	jiO5jr443Z8B+1Y8zK6gybAoEdW+mtZeEXceuRn2jerGmShw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnsc4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:49:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79f1b2e25edso638435137.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789577372; x=1790182172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvnQpYF089Czf+M9+lZyiTORdDIxzErjRe/LtBtTsn4=;
        b=LQRe4bw0N75P7B0G+Ma3l/V6AyLUNo52IwH/44O49QyYPww3sjZUpIZlyDdXyVhFPG
         uh4OHWthuYyDvjKRucokp+hOUfxccUgJpOHNStdQqTFRqBZXLiOscfx/8buSn9QgJR8I
         v+0MRJIplAlPbp1/sSlWyNRl7z/5mKPbwoxBvYdRqwirG3kPHiKuLd/lKXyQ295KlRvY
         JcauJCFCyzv0DDDJhPTKlw5C3FCv4IfwD4VN0L4KLLnCsItrn/oeHWPhlR2HmO6I1e4i
         xma0WcC0DMqDnmkHWsl/RmVarFR9/EX5AVwMpINeOCluMDW5FxeGzpk4/LP+XWB7DEqX
         HBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577372; x=1790182172;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DvnQpYF089Czf+M9+lZyiTORdDIxzErjRe/LtBtTsn4=;
        b=RStVY/9ub4ys1nyYKIYSOnRPpwcT911GHN163Rs32+0F9/xKoZ9/+/fsLSWUP7CeCf
         rWs+bp2HwmhkVBbIZaIlAP/IR5f4zCImQWmoFK9626g2537FFKTc8gGA8FtFjztkp3ca
         YT0+pV/biQgOYbXv3HhjpIjrP79k4hMgGHnZaZRTRek+8tZjL5pGbMOJ3WeXli6eWs5Z
         CPZa9M/xIPd6eCHbxJOZVlVLID7ByHLKtiSg6X9LUsnl3qNzvR4zNVlzxMh5H9Lf2oa0
         JLBveEbrUOx/3mpoGKiBTwZojhScuPV4moXJcWpyRGSLEWPoyDnDjW+AAofZmyVXoq+E
         L/tw==
X-Gm-Message-State: AFuF++kFMA9lgDwhf965PTUEbSDF4GuTgaFSAF9FBMd2ia5w+DsqVtE+
	OimPZM8Wd5e1d7Rw+uu/5ETVuMgD4qSB7kjjsb0oYBABwLwpBn2QPG1N8nAfzmVANwDCQlkrzBv
	G83eo++AwUx+B27vrndPWnrYe32aXsNAbzGi3lHPHWrM07tGRjFYpBtwG+d+NKMcY
X-Gm-Gg: AYBFou26islECobbOTcFfk7JnlDPNRAaGIxzTTcgg+wl2bp0Fe3CQdkSmzMLUUifrPW
	hkFCX3TRoo6dV201KpJjA+46JGKWb06USah6Ln4VFM1aztbHYqvBvUQuxqhPhozeY5W4BADrNK+
	I9+2uC65b6UVxYaoug3f36Rn5OoZP2tTK0QzWVSHmirG+GhzCg1w2i4l0R0lZ4RwiM5i7f7x3vN
	++tPKzfhBOV485nizXWuLhG7mL3yE+dSAFwm5KblnNylU5Z6Jk9c5YbQH4B0RZhItfuJgxZ7qcb
	8NzWEwne0XSM7unDS1PfaCoJ74458vmV0NcSCfbWQ0Je1o+U8ZVRopUOqRMXuVrBgK2BcBoGPbG
	4maax6KxIjDvMBFHrT2fdcXmCQmA=
X-Received: by 2002:a05:6102:50ac:b0:7a1:f7d2:e846 with SMTP id ada2fe7eead31-7a1f7d3004amr67795137.22.1789577371515;
        Wed, 16 Sep 2026 09:49:31 -0700 (PDT)
X-Received: by 2002:a05:6102:50ac:b0:7a1:f7d2:e846 with SMTP id ada2fe7eead31-7a1f7d3004amr67770137.22.1789577370959;
        Wed, 16 Sep 2026 09:49:30 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm4237695e9.8.2026.09.16.09.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:49:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:49:19 +0200
Subject: [PATCH libgpiod] README: move SPDX boiler-plate into REUSE.toml
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-libgpiod-readme-licensing-v1-1-1221405d6840@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI7IqmoC/zXMTQqAIBBA4avIrBNUxH6uEi1MRxsoC4UIorsnQ
 ctv8d4NBTNhgYHdkPGkQnuqkA0Dt9gUkZOvBiWUEb00fKU5HrR7ntH6DasdpkIpciN1aDuhnRQ
 Ban9kDHR97xH+DKbneQEwY4cWdQAAAA==
X-Change-ID: 20260916-libgpiod-readme-licensing-614f7804c10f
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Wierich <erik@riscstar.com>, Phil Howard <phil@gadgetoid.com>,
        brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6510;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=847pePPeKL7uHd9YGMZHq3smJLOkGI6J7KYStUxPw9g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqsiU7gr/Fv9LSM/rNwfF5Su28oLKYxxICwptK
 zH4Nk5cfHOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrIlAAKCRAFnS7L/zaE
 ww+uD/97XSPNMDp3gFzn4eQ0hlcGu6moYVsGBroJoZQ5sZTChLa1fPl+6ut6H60oEhgPhS0Ujhf
 fuAJrMq5JMbCPY+S+gAoKWb170CZn5tUTLik2zemooZcBQlgJJxMDJ/SowBg/P22JEgTbydb7fK
 eOmcZ3SdfyOHU3g8Qb/Qyi5jDz/1zAlC+7YLXzCUWb2IaQtdHYo5kKH4qFvloedVunO89J6odRv
 qD9cmx3seK/H2J2EDfP137f5Rkqm+S4zwbdOOvQYsv/9HL0ksgBZiXG6RJIgI/fUs5JnnXEsPYi
 F4kZBoKJ6iLRDeKU2SI8ibFyK692Z5B0XZAkwZBO3+op5Xr/vTWGUI10F4dGto3zq9/u6L2eX1z
 ZGdUbqSKHWJaJL6aTiE5JGIBY9Jm8E2qnAHWizILk8dSSKM45lPMiizglwdYFLOKtg6FB76iS1u
 VaE7wNVNTn12qpjolIKjHxXnt9SyCiM+sjX9mYywUaJROGXH53GUl8hJ61ngJDYDoa0Vav9grLx
 9omznRgHCrlKZFwimsxvUWGpIJCmFsk1wfJEb/AAQDD+zsjW84RzGK2vcI4jlbE2+wW6n4D3lkq
 z3LK1FORFCH3xegOyEkKcQghWFGH3PHIoBC1+ZTy801GH7KaAu57fMJqSWmxXV8kdtKP3asK/0+
 HvU0I0SWE+pDP2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oC4qq6i6Zfk8-4z6g3pjqxWRxyIXOEym
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaac89c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=69vjhkmOAAAA:8 a=pGLkceISAAAA:8 a=pnj1u9P1UXSuy-RCY-YA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22 a=aYhtgUnUWFLXzY3hic27:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfXznscMs16n8u8
 c2KlGDpJdLD7p8EFQDGK8cVJXSmaJ2TYLWBGn7roJMEWnBXJYVRivd00q/6MWMyjQnbjX0LGU7+
 AEmBt8+c/BD6yxrhCvwGf3qRYogD1IXW/rH3y91B8uj24gXcZKMPuZQeA42rDo+056mqsMh6aqz
 dugE05BxrFciYQFqjUOmfeH9WnuXME9Ltt1rny8T9CurTsu53GCtk5e0qG13aZvOl7U0YJX7TmI
 ip3TeKU4QVKLl1avTMvYnfTDkp1Nc87FkRuNdlw7n2OGMYR4CDlNrmQG16rkxrQSuAR9UFHYlXO
 qK7Zu8qrkCOQD+FcxzUhfjw5U3h7p5Pq4TX+4tILXrXD7pUYIz1K6QqjNE8tkpcp2fA5jM2UAd9
 be2PA8CGs/cxlrYwZKBiGzGC8zWNZgbe5gdrbuiwo+OmMqxxMWqDnvyru4WwRMTY4jmP4piJK8T
 jszCOE1X3LNcY+UlOHA==
X-Proofpoint-GUID: oC4qq6i6Zfk8-4z6g3pjqxWRxyIXOEym
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfX6IjqFIHmd5ZO
 jBWpE3yhz+xbHJpnREnxfcDeJ2pmoxBKt0SVV31cSl4mXk3FuDBor10lIaKKvalozLJ05l4VQUJ
 8DPwdlyTtgXTHOECusl4cxSwOUJQ3CY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160230

There's no reason to keep the SPDX license and copyright headers in the
.md documents (README, CHANGELOG, etc.) as it only decreases their
readability if one doesn't use any rendering tool. Move all SPDX headers
for .md documents into REUSE.toml.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 CONTRIBUTING.md                      |  4 ---
 README.md                            |  3 --
 REUSE.toml                           | 60 ++++++++++++++++++++++++++++++++++++
 bindings/python/CHANGELOG.md         |  3 --
 bindings/python/README.md            |  3 --
 bindings/rust/gpiosim-sys/README.md  |  6 ----
 bindings/rust/libgpiod-sys/README.md |  6 ----
 bindings/rust/libgpiod/README.md     |  6 ----
 8 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 396227dcc121a2ce1ee803b338ac7e92fb8c39ee..79b3d80831da9af53321386e9c07ef57bf05b8d8 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -1,7 +1,3 @@
-<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
-<!-- SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
-<!-- Based on text originally written by Grant Likely <grant.likely@linaro.org> -->
-
 Contributing
 ============
 
diff --git a/README.md b/README.md
index 664dbc554836d3d7c677d79b0d086e611b0b0fd5..7a01ae122989670718149b3cf4721eebf7e51897 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,3 @@
-<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
-<!-- SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
-
 libgpiod
 ========
 
diff --git a/REUSE.toml b/REUSE.toml
index a4bb4c242b768efb38c9f39c59058667c84061d7..fdd845e9c16cf907eda19fb857d92c5f9432514d 100644
--- a/REUSE.toml
+++ b/REUSE.toml
@@ -1,5 +1,65 @@
 version = 1
 
+[[annotations]]
+path = "README.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>"
+]
+SPDX-License-Identifier = "CC-BY-SA-4.0"
+
+[[annotations]]
+path = "bindings/python/README.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2023 Phil Howard <phil@gadgetoid.com>"
+]
+SPDX-License-Identifier = "CC-BY-SA-4.0"
+
+[[annotations]]
+path = "bindings/python/CHANGELOG.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2026 Vincent Fazio <vfazio@gmail.com>"
+]
+SPDX-License-Identifier = "CC-BY-SA-4.0"
+
+[[annotations]]
+path = "bindings/rust/gpiosim-sys/README.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2022 Linaro Ltd.",
+  "2022 Viresh Kumar <viresh.kumar@linaro.org>"
+]
+SPDX-License-Identifier = "CC0-1.0"
+
+[[annotations]]
+path = "bindings/rust/libgpiod-sys/README.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2022 Linaro Ltd.",
+  "2022 Viresh Kumar <viresh.kumar@linaro.org>"
+]
+SPDX-License-Identifier = "CC0-1.0"
+
+[[annotations]]
+path = "bindings/rust/libgpiod/README.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2022 Linaro Ltd.",
+  "2022 Viresh Kumar <viresh.kumar@linaro.org>"
+]
+SPDX-License-Identifier = "CC0-1.0"
+
+[[annotations]]
+path = "CONTRIBUTING.md"
+precedence = "aggregate"
+SPDX-FileCopyrightText = [
+  "2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>",
+  "Based on text originally written by Grant Likely <grant.likely@linaro.org>"
+]
+SPDX-License-Identifier = "CC-BY-SA-4.0"
+
 [[annotations]]
 path = "NEWS"
 precedence = "aggregate"
diff --git a/bindings/python/CHANGELOG.md b/bindings/python/CHANGELOG.md
index 1ca2d1bc0fd901f34027bcb9d94b2b1dacdb3827..915a8b1bc6fd566438b89aae7481408e6d462bd1 100644
--- a/bindings/python/CHANGELOG.md
+++ b/bindings/python/CHANGELOG.md
@@ -1,6 +1,3 @@
-<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
-<!-- SPDX-FileCopyrightText: 2026 Vincent Fazio <vfazio@gmail.com> -->
-
 # Changelog
 
 All notable changes to this project will be documented in this file.
diff --git a/bindings/python/README.md b/bindings/python/README.md
index f3cd77ac9a7912a0211c3bc149475639b6101da8..927c929f9aeda017e6fb6d9d1ed83d718026dcbb 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -1,6 +1,3 @@
-<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
-<!-- SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com> -->
-
 # gpiod
 
 These are the official Python bindings for [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/).
diff --git a/bindings/rust/gpiosim-sys/README.md b/bindings/rust/gpiosim-sys/README.md
index b13f09aff98c5a47210ec3d5b20dffc27fd71f65..5ac97b8f261eee0bfdb885dd61a6d3216f013e29 100644
--- a/bindings/rust/gpiosim-sys/README.md
+++ b/bindings/rust/gpiosim-sys/README.md
@@ -1,9 +1,3 @@
-<!--
-SPDX-License-Identifier: CC0-1.0
-SPDX-FileCopyrightText: 2022 Linaro Ltd.
-SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
--->
-
 # Generated gpiosim Rust FFI bindings
 Automatically generated Rust FFI bindings via
 	[bindgen](https://github.com/rust-lang/rust-bindgen).
diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index 05acd9ea982b22ea4fc809b7daacbf887ab5c4be..4090de6a4f8f8555fe0ed8cecf1a9d125a6283a4 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -1,9 +1,3 @@
-<!--
-SPDX-License-Identifier: CC0-1.0
-SPDX-FileCopyrightText: 2022 Linaro Ltd.
-SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
--->
-
 # Generated libgpiod-sys Rust FFI bindings
 Automatically generated Rust FFI bindings via
 	[bindgen](https://github.com/rust-lang/rust-bindgen).
diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
index 0d764f472abf113d096a0e73b5d21f5790db9137..e06db2ab22ceab3f0bdf36b9c6c87cf36b5f547d 100644
--- a/bindings/rust/libgpiod/README.md
+++ b/bindings/rust/libgpiod/README.md
@@ -1,9 +1,3 @@
-<!--
-SPDX-License-Identifier: CC0-1.0
-SPDX-FileCopyrightText: 2023 Linaro Ltd.
-SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
--->
-
 # Safe wrapper around Rust FFI bindings for libgpiod
 
 [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/README)

---
base-commit: 4946370d06d51e3f9b003e71da416a6dddf9e4bc
change-id: 20260916-libgpiod-readme-licensing-614f7804c10f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

