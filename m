Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685791;
	b=Kz/cQm8uuLY4ypEFJmQGLeM1Gx/F4QoJAbyvNSiCGKDJv3CUl7EtdxZmYeGihk61wppe
	 j8upZ1HyYC4uSj1+RMdVMEeDrJHgIX/dlHdVPNdkq9rQs37Ad1cc6Vtk5v3q2JUyinHo3
	 ZTus7DVE0sKbKWq0eseZwxuaeTjVe9QioBnX/chNaj05Psfzh6NUL7XYsFKRS1ty8SKFI
	 SOwlP7H+qLFBpMtVSqZxPqqy2K1tMmGamr6ijuVL/MB5DtgP8rhCdhI8C7VcMFIQJBUvJ
	 NEjkQ5ipqV76mF/ppIGrUfG0dMMqidO0TvWCdQaCEfbUilm2VFhXCJDD49Hm8BVCMEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=YCzsNEba2DFeGACuLi0JvT8q3UX7z26XlHUfLEqnqs7wJ7CI7ht0TDHQWZdSqb1jI3O6
	 ZIQafK9chpnmWIUtOIkEoFiDZZVAAyPuRd6go7Qnd0fhax15/chPylGdlw0UB8XGetUYt
	 WFIsEWJoWESMxZfpA4hC/WX9ZENW6b1j2/ONSH2FRlkN4xyscE5XKQ2PDtlntFWsJJSi5
	 oK1feOqDmQV4QBbQDttfweRuNb1EA1ghdMguFguwRG85x4b91kdP7EhHlLtzEz6rZtN0c
	 7HUgw7edI+8lCzxDKnwJxkaiTh4DOPDe62mTp22jetzlPsgXA/OdqKjdsp0cLHFCsDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A212606A697
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A212606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2xY1682403
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=HvTU+1Lr0+TayoIV
	jjYxb6eyo99o+UgT/AVaicpY6fcDbW1BMaAX0d223RgCG3hu7zG9AVl6pJuaUzfy
	Eks6iYYvykbAa2pKrAnT6sHg4oGwjRknvKzaDP8pNRX1tuNpAFRhcbcWwkBU6m5/
	wbncP+VOqEGGJcwgS7ZZFH6WAa401chJSCR/I4qf1TDjTT4xmNYPjFoVTAxnCyoX
	k3iAh1KQl0yjEWlKbBQpp75dMJQin2AIa3TVJv7H14t3+3icXGyUAEGtcSJm0pSX
	kQ0WWtPX+r+owfwkZwxH/uyHiZtARvdH8Trx+pPCSIzMCaa7KXk56rJEYFFgbXRl
	mixz2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekg34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131b4eso340645185a.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685789; x=1796290589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=VMZDCdq8Jhiau+uf9VcKBg0uuapDL6IcC5y2d0p2II1nT0Lg1xcZwHL+Oe7E9++3Rx
         A1chdFopN+I0gOs1gbN20WdsHbR8Eu1IMmyrrZeH/IU925FxO4dMIYI9Z0bbqw6mAcCM
         EavIEhbs0qF5KgR0DuBdWxa+RWyJ7AQBcEF7MBHsG/rT6BTVV1w8p2s2COzSrOAFRLnd
         +rVMEnbgEiSRPbEyGwlEa0oR92ExmtXk8fABR64ZS2lidV4h0aB9hfWdKokQIvfi7ON2
         qzr9o7AubfEg/ndAqMf6p2M0BDs+D1wGjSQIM/xkEfQl5z8k8m6Mhi2WD9ZUlTo54ykT
         lpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685789; x=1796290589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=zHjtItd/yXaME62Lnm/9p41T12LRvH4F7VeJl88LeITwNoUZCDD8MNaPr+aSwmMVdu
         s8BbhzatGJ99/8M+IsXw4hwDZ6t9ROmmxKfFI4cz7bwFB8qlVSMs/fahR6ixq97wRMs2
         4eTAC4M0f6yvGb4Kf4D13FZKNYCHd3+DAWw1SwCRVI6VHEZA5Itwiz9JCfvVWgmr37HO
         wk2f1ql8IvJtA3pwE00IarbiCRv0VRXAZojA+tmCUkaQjP8Xnwr98XujaWwrchD+8ne7
         oYfhDQebTdeWu5BO8sqHez8jIrESwpbEVQAAAZoIF8Sz7SS378KlP8U5ZEMxnMmpTRfo
         unQQ==
X-Forwarded-Encrypted: i=1; AL+hErHan3UL9mXr3Nxtt8mOulGbKW3sdCl2oA7/0CU2bMZ/GdusEnQaLZxBWhE8ju/bRcmwAYMXSOOwxLLn@vger.kernel.org
X-Gm-Message-State: APuU4Z8fX+m7eaDbMrU8E/ANeHQ0On3lUx2+NsWa18HPfs42V5PTlVtx
	O1AdCJe1weijm/+HTd8tp1k+hflZ+3mvKDsA4U/KPqPM+v3Vul3hlGnOJ6N2GT7cuPIRwl3C6PW
	0rw5EXEx2TFQkyGELnIPcEXAeRuq1xoUtGZ2w7AFUYqctA64BSrYXOV0TKN/Q2+Pf
X-Gm-Gg: AZFdTZeSMm0pshrfhGr+eSTi5FFU0fKghMigbMEpW/rZW284zHXupVeAlD3OCofE7BA
	u6OL/MDshGwW5K3PWT6lBg7MFSY6+IwC5YdHpf/0lHbqxgAuTFKQloIOCjkt8hjy1WsCmezsRN9
	hs+GFLWxLXqh6W/QollgCgAq5j4gSkqqm58OXBLlQnH9WQfNP3cc5uJxxFI84TfO7/tUeKDzjNS
	CMzPq9RiEHxexIL/yVXuLwiSfxuPgjXYEVbWHf2dKVY0yvMVpguYtN/p4TKEEl/5s5kdU9MSqxU
	jp1+OiqVWW8evhTDe7RGyzAFGWQ0Fi2SGJP+aRQUKElTGVANVL+eH+cqnjy91WtoI7FlNh0Obl5
	AwvygJw/wgD7N4KEbKuwcvfyFUtA2a8WEHD1Izb2ASBQkzjvdZraUF0Ha23SXQDgqAV3E5AzgQM
	CR5g==
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832613685a.43.1795685788872;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832608285a.43.1795685788429;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:19 +0100
Subject: [PATCH v4 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
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
Message-Id: <20261126-fwnode-for-each-prop-v4-2-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UmlNPXMYUFj1OkyjJlNtUg+TUKM1XF8Nu7
 d7XYDXF1R2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8xCD/9IYhGx3cvDc9WQWKHuSblgrzMbds4fs/OJHOvppEcKmijm7eXlATdeZIwTvT3isiBUj4X
 vMkHZeEcEb3x5E6sPII4oL2sLrwLi6Sc0G687C90sYbHjuaF/cvPNwQ34R53OhVsSusUhpn8UHL
 ba9XnX808PqRAwtsHkPJei/FdYKzTAjyLVJTlIjXVh8ePI8zN6IjdXJRCSsPodY5I64A/swlRIx
 fpIfZWyra+oHPh/oY6PilA0cVcLLOLrKe/pvRKp6RxQaCenoPI3s+HYRsODp8vMD+YFabDJRoBF
 Ttfb9xQb8DiNf6sW9Vs6Hz4vwtoINt/h2jzIRwaRntNqP9wbgGcgdDZCMqoSXfX8XPLJ0eY401A
 SlgEgNSWLenIYKcrGhH25okc+JMMYO3oJ55c6yKNT4XbAxUTpMzsB7obKMj/c3dWzHJnQ9QoJ7h
 pqZ2qtHyWZ92+t7QLHW8TqRS7pvmu7vuvBeAJOSI4K3CkAzlm5XUE6Y6NOs72ti+GUvdN9Kj0KD
 DMwOqA0PUUR/Rz379B1UlFOzYoGhxCGxC7Kkwy90FcAsR9whZuHVEf6/oVrPLf6K244LKS7AlzP
 AC6jyUhZAuwrmwu0In9diKO6B6mIe7ozf7LbBcG5/Cl8f9QkcSYK6xla6At0MSFKKhgCB7waqvE
 xLx5I9axDKDlkjw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX8ooX/0Excl+F
 e19ysArBpHJ6xwgji8LORBD6qH1F+Sd0jSymgg5L/rRwHmwGs+SrFczSPMzCMtbfS7gyz63ovpg
 tjg9IexpfrzmaJi66jBdNfoO2J6D+nX1QgO5cg0w0hzmBm3qworYCvTX4ppc6NhtlXg9WqaJf4j
 k7wNxgPHX7em2JIs44Y53d0WhRJlork/XBfdi6LYpyGRtsfzXHSlyF703+Dv2yct+aImqwRh3Bh
 nd/HeX+bshT4bQsf1KMMeDabm1R89uXi6FAglPDIemmv2ZovI24IUALOQ2rnVRZoiPNyhYunwH0
 UtAxJEAHjA4XfdDpc4+g/bOIOEdp1uPUQanZofxbpO98SD2txWFjgQKLMSCL3mzEldHRMMR1KBw
 lHwR0SheA3kMAAHIX6R87HmDGxRIY4CCsZsYjekGTk3oNqJgqxRk4DKZiZv1GAZc9aCGXkvsuXK
 +IW0RufVG99xg48idUA==
X-Proofpoint-GUID: GyIrsxB-f9F3-U7GsdBQbEBDrCvKof-8
X-Proofpoint-ORIG-GUID: GyIrsxB-f9F3-U7GsdBQbEBDrCvKof-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX6vSFsHkIv3S6
 pr7IvkPHxFKsXGPQKgtWz+JlOLAOWXgYWAfOMeXE1nSBbbBZD48I53gaC+9Zl+2AEmM2E7aJgGy
 ln4S6oECMEQHiVjyNkpJMByILfhyV/4=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07fd9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

