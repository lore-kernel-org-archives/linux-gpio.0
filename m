Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584840;
	b=YfvKnkVfcy+06v0oHdHG384BjthLqAVZGfoy5HXj7FKZ/Tc1QNpDjv4xYn+IFHsywovT
	 v/EU/iZTk9DJcBhM0D3jS6mSUFxzKUg2EDVmgaGiXvZlaQO8uaQnKB3Zf8T8vvDnOICuP
	 scaAdZfm7hMSm6bHihJkdZx6pHyX9pJODv1pT6K2OX5A1q4gvW0tfVca0B5rUmqf97c0i
	 xNpdmZHYHH2YpcEIWZ4GDPXlB7dYNd8KGzERr6t1SdywAlO3p4IN39rt5vNKWaBlla/zY
	 20HiQc9XwWZ8C01wgR8i/uhdafq24/TkfREvyZ9dZu+Wn6fh4bJ7MxKMw3pv20KTkGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
	b=oxSsGmEwQ+rJ5uRMQ2BO4vmt4Z6tVLl0Fiz08YKDOJI1UoGm+suLgP0mKpemYUlztv3U
	 VkxrQoKakuPQO8gecrPFE4Mfuatee0KucnLzHEPJJ9/MCqQ47GIY8/PXHO8kul7GjVgZ4
	 6k8PGKkxvd2MCGUEHEQz9oUOSwnwKH3g1+eUKVlNHwZ0NrxC3ruCYzHt0vucVNMsdyUEh
	 tAGk9WyQCznMYTr77R5PE1dMjQ2owj6gzMLHSyuj0dd/89URX5Ww5RFTZ4hY5IPqUK9Mt
	 SYuD50mucY5TI7Gne4vFfUlpw+0GS0p00WOTlsjkCcyIKUE6NzW++4ZZRuTq5rb4oZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpMr4GKR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bRfZkJ/g";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78F60A2638
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF78F60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpMr4GKR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bRfZkJ/g
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRA6V3618616
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=; b=OpMr4GKRlhgCOGW+
	oAGSvwB0vkJOOjsDJOtd3OP053b9V4LeAyAyj8vA0lRFB44J86PJQ9RFxOLDHojJ
	IwXzkvV/h1+Nmxy5xNjiX/x0d1B4/iC83yuZv0evZgcJljZL/cG+aFWElWOmr6gg
	J4tc0bDPU63W8+KVjnyO1SfLgSRhT3rlLiTk4V9GcJmMvPzhCUNolVltcpOuiNXb
	f8URnRdMXrUE3MuZU+8U0SxRPRVWrBS0dUIfj+wKibew0Cef0CwrLrbcDqtMQ1cu
	FteLYwh+SR7/t7hGG2UUMkBi0X0svHdsWsuzgV0jmMEP3n5O8PdW7uAwQPQZsBWk
	P6yQLQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcpu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so203668137.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584838; x=1795189638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
        b=bRfZkJ/gWn2d0FtIZ6Wl9MdXi9MW2lFMk/zK2V7d4FNyn4MF120e5KPpufjOtyqCvA
         /L+QfIVtJ5NzVrvY5fnNFe5ZMbLeAoW+Sv3tCw9UWW4ctNNHDDXXFun9SrPcVT7g3bO7
         Y9EGrpNyMpH1mus2nYjmqg0McPGOJo/BpuxbrgcWJ9xVw4Q0CVtSHFLjMzmGC0SngXkG
         hlEzHizfVknMnnCy+vl4w4pVYXdhdq0GKV1i5Cfb2Hj/kxV9ke9FNyPJmQCf/UD0nDUN
         Wuy2dqZkD2BCPP3Qow/pJoVlhAAu2OMOUG0QAl+j7PfTjPNZ7BLIPg+nTwIRKkjHcX7Q
         ZTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584838; x=1795189638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKlW1GfpE3XIGbjx8l1IseGsgl8DrSMviVv6wGUGyGs=;
        b=E1MB7bJFEEHa5wGLzGHgz8mK4ZA5vYck4Gyop3hBwEhW3BUO2BpzPvsSR2w3MlbwIc
         WEoBTLc2cmWmUTLz/RaujdtkBbMU8ZFcyohN78aOFZH3Aevma3/T7UgvAW/iF0RwbiJ5
         CcTTh9+qIa5Nh+2iGG+pyJyudP+aGiNAslrJmgHMziYNDDBIN/prxhXkAFLUf+eGDRt9
         sap9IVJygMhmZbiSghOoWDkl7TdH6L2iyuP5ZY8S82wm+uhAvMdRVJ+9oRZsIY+lPMcE
         OxYpGuX3yHv689vEY5Ufy39ekVbCz2lY1hGYv83lQfN7NE+l9vp8fYGT+S17TRE8WKjd
         CDYg==
X-Forwarded-Encrypted: i=1; AL+hErFnc8FCbCyuLHIqfGaTFGA5bmYcQbvnQFKWVGTPOnLmIqBxA2FrLrDenyPn0kMUeDnHX2i2ZcnwAqnq@vger.kernel.org
X-Gm-Message-State: APuU4Z9uYcF7L//EZoxzItljnKMkOoHgWJRBqTgfD7NJ4Fz1bVMyXsPP
	IkIuxqSh2dNVnJllrqLN/RhQBmIm3ptWLUPchoDJ/4x+WM+QbFs+V+Tu+Wti/CuhM6hGZdH3czM
	omnLGNE+3ykUUCV0c0u0d25dx7o5eLjILJUhsMuziUGdtf9LanCH3aFx55rrXP59Q
X-Gm-Gg: AYBFou3Mt5xrmPOTY+FBi2g7EfIsxZVW7j2/d5LZbEH4V2yGZVlm44PqFHVuVa1MEip
	Xu6rl4jxLUcoNOp0SsiAbT6BXdB9MSi1OhlWjmYbliAttvAVfAOBnHzhmANH9yyovx1OFKzpAA4
	o1vf4UNMs79AhHeXvZv+D1vot2tmD8S7yY6xbv5oZiu7ryTOEHKeR1G4IRjk3H9opT8WPtGZ1sX
	Gu5EDh6XxMAQ6Ld7/O2qDsgEIffDc9DWB1roy1lJrxTAa7dfPPG0kiXbI7Ttmr8XAaMpnSyb35c
	rdJCIzOGCbNLc+0JZFeIR0jqRsER1V8rPKAVQUns3I5wx2yCexwupPMqohYejQVCKYc1tSLc+lF
	Eth2hGOThsOeFiL/ua2YRWijUTCi7/jKCKLkJHHDCSLoGsImkdx3M4VCAzW09tCqlDB7st3kh0h
	rtkg==
X-Received: by 2002:a05:6102:511f:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7d64d770275mr763684137.22.1794584837861;
        Fri, 13 Nov 2026 07:47:17 -0800 (PST)
X-Received: by 2002:a05:6102:511f:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7d64d770275mr763648137.22.1794584837303;
        Fri, 13 Nov 2026 07:47:17 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:05 +0100
Subject: [PATCH v2 05/10] of: property: implement the .property_get_names()
 fwnode operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-5-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ByGt0Wun0kTw8gtxY07rIdqBJJaAvKUMm2U7zjbf8qU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3LzKXZG+ZjU7qzjenQKDou5yHKCzqPZhLQ
 LzzR+h51yqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w/4ID/0Tt+LpyDARJ0d+BKtRxYefGN4cbRKTHJQr/JXKhlbiMKuR3UoVMhLlfPEuceLcw9J3WBP
 SvKR0EoEih/KGjO/UqyHitem7T0QiX2cTqnOrTSKh6uAyk3LUPv3FY2d3xuu0OmzhAeQ3jk0cI8
 RrMOpg1DtAxOIDWXvabOm1fvI9VL2yJNp4GJIhBcx2Co27ZYFyPs2v0ak5YVwfOcg3NMR+7QX1/
 2m4xf8zSJRKcpDKNkOIvXDlD8qDBpqGxbubXWWFKSZI4TpSplk0pgBNN1cRiuu8O95IqpY7oD0b
 RTTjmG3mNjycBgmkGnU6k7fIai/GrujJRTfT6fR2nyWV6ukXzriiIcmETNS/dnjeZiC9GYP7niW
 EJDCjGqy7IT7D1+xizEXPRyQdDAyhpuHmAEPC02sDHOfZvwWm6fiAJ8P77QJ43XzC+6JRPpyAkF
 6e1MXWQuf/EmEHuL+kA8f4DY/e6qsqW+64N5ko1YD6tgJ1sZvx3Qrr1bo7H7Vlnoh/SWh/jM7SF
 QXY1dyx0UYw4j6VTOYkOjP21Cf8osZudyiCM5Meo0O4W7kxrzx7PuxxUKVB6pmdaPH8BI/uQi8A
 VWzQEszf1wul0oBLEBVAoRkXz0VmH9jVO6ESDGfdjl2i8ojONLBEGXiG1rIf60+KHl7g3NePFRK
 ADxUtbAmYECsXnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af73107 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cT0tItDctYQywj5JGBkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: dn46MZ7BqiI5a7PHBG36arS3UTZL8I_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX7SQ8otpzlAVw
 UVCy0WcbB30o2K//rMa8tBe34LR1jM18MDjg30WN9Fy3HKcpyCzsgf176bDrN0osQ9AjAUPKoTD
 T0snnX8B4uI0dgjB1RclwGXT+4LaNb7yVpg3YKyknFwoBXV/17cqqaoebUU0z78UblNYuJSIIZn
 CsqggIMFLyevjINEd6/5uEYMys14DJtZ1a2UGOlQA4LnrxV1/4olC/BGV+5x0bmzPFi1SILHscI
 JtAon+4LEL+W7P5tHhlOgqtsAevG11E0BxBu7ugVi+fDsdWnpO2rn3KtDIoXVgkO4/j6HV76V52
 +4J5izm9pHF8uf84q7/3C162ZfoVOQpggBoMqdOs58hGGUBdSuqMzF3B+a1iGORGENitq8gAP/n
 cJWIgi3RZxzMyvMudLUtgC1I4aZn7xKNkHM2yF5elNhP8xRQ0L7/Ot+MOnAueaD8JrSPuGJUp/2
 12Me7CP2KikGiAUl0JQ==
X-Proofpoint-ORIG-GUID: dn46MZ7BqiI5a7PHBG36arS3UTZL8I_9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX/HpJ0SIjeA1w
 EoGBOCAS352NPTIR2dkh66jVgREZ0g9Hw38Wl/QvVPQ9V6/x+zRkLcGEFEKPnJQO/WBuOaR7XGg
 gBlwJUyn90wSwojYoWa/Ke4zJxiRPCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..53f2c84bcb96d3a00f3cd2371010628493d49bc4 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -27,7 +27,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1120,37 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
+					char ***props)
+{
+	const struct device_node *node = to_of_node(fwnode);
+	struct property *prop;
+	int count = 0, i = 0;
+	char **names;
+
+	for_each_property_of_node(node, prop)
+		count++;
+
+	if (count == 0)
+		return 0;
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for_each_property_of_node(node, prop) {
+		names[i] = kstrdup(prop->name, GFP_KERNEL);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return -ENOMEM;
+		}
+		i++;
+	}
+
+	*props = names;
+	return count;
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1712,6 +1743,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

