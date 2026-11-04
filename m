Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801051;
	b=I4pHGCsmFCmBAJ68OLVvjz3U5VaVgu/x6hgVgTN1oGXFGK+xAVHclJA1DbG1AkZxokGg
	 n2NtQ2BaZV5o7iq3kIC7de8aBOjkgCWYOQv+4k4JWTPYxddw6xrTF5kCyMymgPkklV4So
	 9bO+vn/viYqVQbjbn73Q50LRv7Ws66VeZkcRjFz1Sm0/6Ufsy63XWh6yZFPTC7kpNYfRh
	 sesEhVmqDG66bFSRjhHk7IvhowkA8w6pOzUCn5nn2AALgIFbgXhc8lmDJzqE8B2EBTxCM
	 JHc4FkV6rbbWc9OiJ72xONHE4AZ9oNbQgNTI2dYQTxYJHbNMOvefR9WrNlWTLCDObLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
	b=KMeGIi6aDPAq8hmGMDrqtBewTab98/3iYBps3iWmFJN/Bp26CAHKOoBkBkDsciE+9bIP
	 78ClSlCq2bke9QyGY7QzT5vWai2yWQK6ss6UI5ojYvy//+aLzJFuYv7Zv7a4kzZ0D7J9Z
	 A9Cc5X0m0epilwf/aiWm+Nal3tyGGEnFffjJk2oS5XnD38rlKtf+skIJesBzgx2IPOPTA
	 8lMmkTyjEZ8c/B9xlS/9OHwSIvsBci1KiUmi2AYZlr3ZAtJyV/HHNVa6qe7cHHRshhe2v
	 /Te2G+Sq2A0mjDzEow7Uvx+Y2htSRy00AQ93FfYVkO30EPLFZUO1AnEqcoWIfScfXyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TH+gPYn3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB5606A33D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FB5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TH+gPYn3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsGj2284167
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 14:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=; b=hUrJSP0Mt8gOwM89
	5KbD6f1dJANQXZnFSR2CcGYiV3U7yoRkZhd1NTf0ix8a+F5TXzpgjSDBq7yCUqw0
	GAMse+xcJdgSfPtL4CqWLceUFzTW48Gegyvj9VZJRBu4eWz8QZHrny9HV/AARVZC
	Jdqzp+ya2b2KmUaiZhPm9RNgccFgI/9QAqZS0YvuOif9nxZJUP4zw9niVCspry4X
	eQAQaird7ZE8wsa2OhzgUH8gslTW/92WrZBgUo9M8l3CpI60Hw6l/yrplW4KL/M+
	2O2K0vYLXBkErIh1/qG/G/z8MJ94F4n4n+hBxyqV0imU1U24j/nT+CyLmbc2tE61
	cyQWEA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s02u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:04:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6fa0f0so681079e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801049; x=1794405849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=TH+gPYn39HTVeHEBvKfIFgktoz5xnOexU4GXz67Sc8Reh6CpompYlkMNg0dspiZU5A
         MyzgJ3xsqEIepUOcfvuK0e7k9fzluUauUdUGNI32bc+kvk6V8l2KDEccr3tqaUyHvvio
         YuXHnJdszwu0FL3+qv8+tjLRlqyuKuBtfRGNu6zbGb9GStA08eb26bTSA4zLGEAUbn0y
         vW8xjvw6oSLmqJrujZOx+VOmPpti5QPnpshM/BmK3DMWV9u7sXL9OUSvoWUwuoRYFc9f
         /pl4mPyAw9mmElCBpnv9IQop2sjEp9Pucwo8fjww2O8jTBJXVtBozMeNRTlfjQdu9ubi
         yG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801049; x=1794405849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=Yr/QwSYIu7+8Godgo291AEIrKJUPYRH7HewBYsNluq2Ma4QW8vn9ok0xfMu4ATs/4t
         ANehMxyfZi0oaun3NEDcLa4qGlcngLK/aPjlxymOPHia1ArLbKPNp3Hl7KupftO+c7Dr
         Hy9f1XFDYzJKgPnRh3rr0aK+i7FrTnjY3njupD2dRogMFUlH93XoQfQa1fV4TNaYLiVw
         38XMiW8Hi0z+rjcLB4Inocss05NRsZ2p8PAGCqNKnNJscM9rkqks7MWsW4HOyF+wP06H
         MUSkkwpuLa1hdzgbQ+aPSdJjhbwcy87JkND0/zXfh2pR9+9IyFOkQs+tYcKxGY3e5/L7
         1jhw==
X-Forwarded-Encrypted: i=1; AKwUvBzZI/4q77e4/vZvA3/jnBdzXY0cQ6+NJyflbtkoNrycKAYu/Tc+HchrqRq5lUASLH0CGWzkN7sFPPP3@vger.kernel.org
X-Gm-Message-State: APuU4Z8mn7Rbp9tDAG1XG2cHqusurfHVdC4h57Bsa96CSxf7zn3WYwPY
	MZlNxFHXBuIUDZSKSYSEWrsMgo14A+169rtqhgBG4TjOGXRi/rQxd4VIc07sbOFkcF1I32fdW9I
	42dREerhdqDp/Yn8jBxisTlgreVat+VKe/QxgkvIG85BmtI5EX5wle0zZyNN1pvXk
X-Gm-Gg: AYBFou13NdhL2FyjXEmrSdRz4qIuOzGK9UqAnlOC46WvYfW3VGLhz39DBfbib3KoM9y
	GYoW9U4ikiCXYLXInK1rsQOP6/gvBzmceTKbtwwDk3DYE4LQaQLVEVmJqaOC5wKgG6CuomlmxnY
	+3Fd5HmqlS3wh2aMZYJ/kszae6eAny1HsOi54nhWXRaQvbRX3fC1koVMeBLOBpqzC/0HelfoLiR
	XlYf/HVVjg2oGEQFMStIlcL6qYbYZwmx2AkMY2VnjJhxduTrzEFsXB2lGJzGmD4fqMJ5SExVvN1
	+Wzd5NvDvhTDqVWo8yfQZ+TLisDi8JgKpN3uC+cT6Hipsw0IZIm10nnbc4OW4PHoCHDyKLsaFSj
	voinh2pxP5l1jeZLVwPjC/6QSafZDGi1Ki6UiqfWhuzUcHeoeELRNp5M0g1yh1/8fxD9YMseEC7
	mQfQ==
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134472e0c.3.1793801048577;
        Wed, 04 Nov 2026 06:04:08 -0800 (PST)
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134392e0c.3.1793801047851;
        Wed, 04 Nov 2026 06:04:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:43 +0100
Subject: [PATCH 1/9] device property: fix fwnode_name_eq() for empty node
 names
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
Message-Id: <20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R5+4YFOhCFZOKo/xPA+jYi8jqwmw0oVnYVkmsrZp3qo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztR2VZRR8SSzbH/fsbXq5OEdxvsguiNVfCLx
 Ww5wWSa7BCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w5PBD/980NX1kpJDXHWY0ehLFm7ONkPKAuH/9fpNf1NS3nxrcWUQisefHOE7Rtk/myleJL9pvTZ
 YMTEJgUAddIze2s4CfeWGuQ8XZFF7XDUVZUbEbOtrLh48sNh7UZGAGdmdk0hiu2lX4cpQgRYCSK
 uW+Wi36cN5USM/zBa6uHoUVU16ijpbYdu/5buK2ZDpIuGVch9S4Cdi3QYTY4GuX5TTABbhDhMFv
 7DEAV9ZrMrQ7dAL2gqjtxufFE2m9E4dVq/OPbCMJd4uGCAFlbesp6DVR74ibKRP8u3vU2ZR0Y5p
 9IoMSuYhDCzsg34QdjJIKo6DlnCAH69Bv8z8luC+IjDAhxjCkB/BiSaU5R9/mq+7N+8UjeaIhqA
 GBwQmXvGVSyPqZkUseXbxJRz1zqT44o2PPn4T3Yac1vkXS0a2/FttiXRtpq0Yeuavow36rpt+Y5
 6/jgqc5sChJIQi1fUCFZZZtM45m46b9Zg9iVvaHk5deuUjR8W9Mrepc5mmFJKzrcaiPf0uy/cDO
 K157bZ32oblK2TKDNhw3Vsw3q/WsJ0zudQpSEB5tTuopcYARa1H0I7e/v/UnvXs8HYQ2tMzx9k0
 aT+SQXgewV42y6g5n3wfSwcX2GBztUDAy2y5NR7b3xRzlyDSGDM6IpzefrlsoUKH4riVfSSPn1q
 dT7ZIUbHUkPawWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b59 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bz9ZealoQtrIp7hKp04A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: GbfPewHO6cirPW47GPWEIJ3FA3mT1064
X-Proofpoint-GUID: GbfPewHO6cirPW47GPWEIJ3FA3mT1064
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX3/AZ74O+SQrz
 ZFN0i9yuhvHrabilJddY3+u/9ugy/Dx2L4ySARJPbDUc15oWoZjYbEbiyAeOHyuIr1pgXFWPR7j
 6mRUJ2JOrC/M6oVzWTBgH0ZOK0wcz1yfqPHcyaYhg1t70fPgdKnCYbr9xlOlt9ZOIC7FbEFWda2
 +DSL6mDQu6FxyH01gekDN1qCIAvZnPpHgpn1v6YYn69JgwzjX9F5TPOvhXTDYIDf//0KdchjVm0
 P0HRnbz+J3rYI44DUZj4fxjlIDHIcXfwEbs/lcGDb5RAzH4zHhMC5KS8g3ra+3aIx7B9hkNSmQR
 Zjmt8MaQVb7c8LiffzE7cw4jlur9DMZbKZUgbb6UK4ZYYmUX+077f7xRK1YKQ0vSFJ3cDeCpcs3
 m7LlgDuYERQ48c6+fxzm3/UbETP+UInQF4v5othQDmX1z3qk1jPnEOri/iOxGW15GAuIdmh4axK
 BbTb2GJ4kJvG/kq3eRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+JSi5iMkPKz7
 tR71L7d/sPLPAM50pdZP+qM88ggCiBmVwo05zLNCFFD+pbrVSSewo3WHtGCDhs0NKvx/mh788B6
 sqklbvGUnJRum2eiEv8+Xcne0Tzy4SA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

str_has_prefix() returns the prefix length on match and 0 on mismatch,
so the mistmatch case can't be told from "empty prefix matched an empty
string". For instance: the OF root node's name as returned by
fwnode_get_name() is "" and will return 0 for any name matched against
it and since len is 0 too, fwnode_name_eq() will return true.

Do what OF code already does in of_node_name_eq(): check if the length
of the expected name matches the length of the actual node name before
comparing it.

Fixes: a9c8c738066b ("device property: Add fwnode_name_eq()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 51109794d7275ddaf4571584d0e77d8573ebb475..a97575ff9199004b4f401f432aed6c95e40d0c25 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -700,7 +700,7 @@ bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 
 	len = strchrnul(node_name, '@') - node_name;
 
-	return str_has_prefix(node_name, name) == len;
+	return len == strlen(name) && !strncmp(node_name, name, len);
 }
 EXPORT_SYMBOL_GPL(fwnode_name_eq);
 

-- 
2.47.3

