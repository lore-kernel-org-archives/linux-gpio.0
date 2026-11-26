Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685804;
	b=TzWrjq/g2bWgaVeFoAzoOMS2WkA+l72ae4KIBl+PxUqWOAk0e4pUC189yWw7qbIf3nMg
	 EpHUDb3OKr1V1jK12GSYe2HB3QAH35EHP43nkU2NE4/mAZ56BhR+H6LJe29pzG+0i5ZTg
	 1xfwfe5KokvNVCT2WcT5oBG2+q1sv4gBdUK2AnIE9eOLqLsJ678J9dRbR/0zgUd7zt+pQ
	 HDMxHxXkGwcO7ju37+dIkHmo7RI1Zz3lKssQeQD9CUth2g7o9I1CORm89zRPpuaY8FD/C
	 keE5pJjLrdi0FaUEcgVNvKCIJjTHrr4uLUazbBw7k75bsBh6Qm6TXVQPs1jmraXtRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
	b=vXrX5Bx7afzOYAujhdPZqpVvfHbxy1E06LPwH9CVoClW5psVCG7FTfnL1iWhVGf/QkP8
	 WVEYsZwR4pusA42CMUHC0xk0i0L583WWWFguKGOMsWhxHB8xcQXKlaco7iwCRmSyaBJ/x
	 BIX/aUcO08NgvjnPQnnakR68iG8o8wb3cWTWFn/Mob/irZQU0zoL+sLCrKEQ98eZznxTe
	 zdCqdCErG/w8zfgY3eQPCSLDmYxHqJahKYzNmYJoZvCKzDhHgADpRKbTR59ztBarb6+yD
	 dNMOcpa57vsTqSgG9oM4U9YGG+YOChmTiyIv1eFvJgg3y50f2Z3v2ftwQ8LvM82ERBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hxG/b0zC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2E606A6AF
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C2E606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxG/b0zC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B6Vu3548371
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=; b=GnhbKINvZiX4TlRK
	gmSaIjcT0BhI7n9pBjXuUWmNR7MA4/hWlzFRDQPNxvICCoDIbo2VIXGhhYNtrenE
	LLJNDvzP+jFPPtUnPdfrRQzzHSsxxD2rKftRy9cV0H8Bt9T/Td/ez5edQlq/OADm
	3BTbe+d5ERodhu3llah+pIDHbrA1j2Kd3EYpF8KLbzatnnkthTxIpLuYbtpM+9DE
	SQameL8twA5z/tW+Ykn1fXJmOhoWsncKZJzLPGryKdjbTQhn+JmkY+bry20iXoEY
	TMX5mQjB/EuJmdyzO8JEYOlxnOtW3KI+bsKjKqtBUhg/JDbUZeZYJt5Fyu0UsWXW
	6VuYXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauaf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so1141891285a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685801; x=1796290601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=hxG/b0zClvSTn6hVKOw60bLmgO061kNfHwAwnaVnNQC0t3fps+ZLK1z75+iR4RX2c9
         1YQtGWJKESi0Pg7x8BspMF8A8MIogElU4zJ+P6TZgeg3hPAoYyAAg4M0Guc6+9cpMXnp
         nF7kXcP8hxFWy7SSq6jfhwGKzYr/5/XAxWk7XiyrdnnefOVeXzJEPh6IxMy8Wyy3h0Dq
         k0tlhkaZsw3CbzEzQ6Y6kDfBFYAe4nLlEblnfzGzdAUTLzmru0r6ngTf0DwHq5m+aeSc
         0mKqGjvg7H5sVEWsoP7kdUsqaJ/pp9I/o2u3NsOwWLbZ3EEogrewyIr0FWVvUT9ndeNS
         sfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685801; x=1796290601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=TYpn1KwHV9JqD9czYgyOhiSadUhm3FRd5Ant35JFinoZpZnjLJwN3Q3hd71KU5LB8E
         oke8sIutt1C8NaU2o9JCcgQkKKKFpVTjynvtVNLGSAef3JRQYhNmVXK697yfVjzeuRQ6
         Hyg1MBS8HqzFgA+SPZbzKU0ZU9DXVJxgV8NNhCXBx5mKQdwdLqrDklIxXhlxyeLgZxlq
         qASFy1p8x3rwZGan1KG4+EqHwdARIwoPQhiEuFw8S3gidUwe73NqUTanB7JPoJ1jgaL2
         tH40M71brjTLdsTP5PRNcQovKbrNK6XC1ZjiCtWwNQyuFKYz1u8u3NpnGngwjSkIBxxx
         QJsg==
X-Forwarded-Encrypted: i=1; AL+hErE5u3YMrS/WtXrACdDUqcCf+uxcQIP0X4vlqoCdensac609mkH1jNM91vsF4/QnfqzOB20inqa+JwzU@vger.kernel.org
X-Gm-Message-State: APuU4Z+qvA386PqbpOxgHP3xdK8AE5V5bMZ/5GJR31WzrcbfNB+qnw1o
	YCgIgqcKV/GnK6Y5gUhS2uYOaNW6srECtvgnC8+7a4NsX7OE2Jfsiv8PXAOoKxaE87Mq6+BLrmh
	CxJh1l88LU1yqttJp/6Vd9d52kjWr2vxECMZTlVzAmuskMkeiHMfT2n09nnWC6pBx
X-Gm-Gg: AZFdTZfM58HUKuuZqqH0cRDWaczTbPkidTxpP5feTUOQoiEDUaEhTSug5Whvkw+Bsbh
	hkyx7Zy168Hz9/Zqc/WI9t6oBemayU2xvvYxeW0V6dYii/v7SzWPZMzWb/WS35ZAxsJv9EcoVlD
	bwGj18cvcyLukV9nhqATWHOtJSiA0qeTZoAu6uaukeckatEOWXOBLKby9LbTxP5uORmLjnGuarF
	Rq6UgLM4tgatF8i4N2Fnk0cU534KeLUKOEmGBH7fPiNz+mCaAbGwj+qE7ckIi1ZIF8YrQssa0Hu
	p+1yfTnk30ZXqo9NoNa1pa6D7NpSaHHFzhcc6nnzd8VAHz2tzEs/PDSkXJP7UfLH6aeZx39qrGM
	rIvT/7slso+amH2qKn3z+mZEegoABgu9f7LGYS72F2FtoTUKUpFkTzUj0bXRnuXk3aeBh0IbWGy
	5XDA==
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819569985a.36.1795685800802;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819566085a.36.1795685800315;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:24 +0100
Subject: [PATCH v4 07/10] device property: provide
 fwnode_property_count_references()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-7-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mWA2E75AM7RdS21w8SMPhz1qTA6x/LrBIO16v2e7+rY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UisD347EN/dc8jXfWJ4e2u4IPz1qxiWy/O
 ewolVlXqfqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w1umEACtRjVQioGlR6scZndulJl2TJoBoriH4OQ+SBK4qhH45NDlvAaaMmrJgs1dwORfxX6Z6ng
 YYYbAB4L5GGkjwvFfCSFIlyeMdhliMw+mI0BdPzc/90jUyfIewR3jccpFZTMHw8MUNMtT8HJ8IB
 Aq41FesH8YWIP+CuVoyAAKAEnuLN2SMOiSoU4m0A9C5GgRXcWqc513DQxkBjPc7217qWEExVqi9
 yOrmcp6JK03mrNrnKkEJdRCUOToLhCDosIUw7kQQN3XKjymkGfCXVzugkgBgM9x9PM9P0d161/3
 YOrcPdz4ThIVtS0P2+/cLKDF67L0oAoYQu1G5fX0qEllWqNjnNGTx7TNcPr71g288meQ9OMtqBb
 NFnU4YYJt/m1KQUBmNceFZ8FIuZXnIYsl7cSBu29nKvBb2tzU/qiRehfBSkcvuRJNPjm5YKrd0C
 H8FxsmJsM/gBFf0HPbASAWH8iOHOfnWYhcOQ2v9OHHobqHN6q4uoIg1/HFuCfhhlNuyOCFDHi0/
 +KuNlWqr6kVWkLB5Bf4VGTP69uhk92vGsuVsH2W276GnjHMmnib/SjRQDFIejddiZon7du8ACsi
 5EJ1J9WXntxbLpZJ9BJLZ01ndaqPz0mzHQ7EPTcsapEeuoRVgePUVe1xCpGhoBcy8aPKNhunyLa
 E2mjAPd2EXHk6sw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX6E7tpwsbhQWE
 eWTv2GZZRJRCSdgyIbsXfCgr9DqRIDTKsYsq8VqJdZ6fd/Eh/7tIErHT/3pyCXLZOUG0xurbKxL
 72E49U1gIvnML27zmOp06G3cnshrXD4=
X-Proofpoint-ORIG-GUID: 5YcE_MvUaym9VJ6q_eM3iSnpT2DRgjF_
X-Proofpoint-GUID: 5YcE_MvUaym9VJ6q_eM3iSnpT2DRgjF_
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fda9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX3SjrcVbOT4Vc
 8XSee345BG3tQKo/7aU/d7plpdXLYhc+YHNr0t5mz82s7rcGPNwauI3rtHcxOJFzR54dvY2c4U1
 DyPCZjNNvWe/aNwcQYwy/6MAYVqlUDFxAo86Ct4HkAcYPj7x1Hc0vpfghN+qDutPWAz070HMFTq
 JMzh8wEptV9yWVLdkP2TI39NuGkz+ykCLdBWV4O7A/EbEA/57C2CTCKOQvcy/U0xpHhrJorGPC/
 Rqz/xVbKvjSe+dUpmhW6a85QHqT6hiwGpaKFvUpGxZUCTMgE/tQoGe2YtWZMr/7atQ01L4eE0XY
 YdhsjlBQ7ez9BGGSC9nhUbPtFiAfb7o3DGk06egE1rf0zWnvkbOJdXSzo44fzdTSuO7jMvbeNoF
 J4vSONCrs8Hyti9JQtaSn7Fd2tbU7t1nbr9S+4q6MPUkqtNYPjL0bRCoHfk10LuirA9X5RAtwVe
 r48rVbXyPetYRNpAgYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d3c54c3d11c42ba4aef68687fc27291c7f33beb6..3cbeb147134143cf68af3213ee75c371af363f2e 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -655,6 +655,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
 
+/**
+ * fwnode_property_count_references() - Count the references in a property
+ * @fwnode:	Firmware node where to look for the property
+ * @prop:	The name of the property
+ * @nargs_prop:	The name of the property telling the number of arguments in the
+ *		referred node. NULL if the references have no arguments.
+ *
+ * Empty references count too, so every index in the range [0, count) can be
+ * passed to fwnode_property_get_reference_args(), which may still fail for
+ * empty entries.
+ *
+ * Return: Number of references on success,
+ *	   %-ENOENT if the property was not found,
+ *	   %-EINVAL on parse error.
+ */
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -ENOENT;
+
+	ret = fwnode_call_int_op(fwnode, count_references, prop, nargs_prop);
+	if (ret >= 0)
+		return ret;
+
+	if (IS_ERR_OR_NULL(fwnode->secondary))
+		return ret;
+
+	return fwnode_call_int_op(fwnode->secondary, count_references, prop,
+				  nargs_prop);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_count_references);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/property.h b/include/linux/property.h
index a70f3c4c087dd85390951da950c3632f89c6cfd1..9f0b9aab5920513cd468572fa96dbe3371609591 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -137,6 +137,9 @@ int device_property_match_property_string(const struct device *dev,
 	return fwnode_property_match_property_string(dev_fwnode(dev), propname, array, n);
 }
 
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop);
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,

-- 
2.47.3

