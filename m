Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801077;
	b=n1Z+a1vYt34oZDG3gY6gCnoA+9M66ySUj8dSJ7skU19u3NgeM2hh5bSZXOkekQ7Go8NS
	 XR9Q8/Sro3fQAZyVgMeIlv8bbr5qaQpv5+6RUJ95Yhrj7F2drsZ7e0rIdT1P7zzG5GXdp
	 FMnnXVBX8lQIjbpOmN/0paag0dqd80OsV3edtkJIfTHpQauxaSavONtg6DLq36fmLcY03
	 PR0zdZdTHwGOHFF2oZmDQpB7/KBVPQTlDSb/BZKP8JhOi7EP7iD01YSCgBLK/1ccAnZRk
	 nTDvVV9x38+sfGIkFmNnGFlN6EIFlWZ68HZM2oaK3+glAc0I/r67DQ467R3/fnvZ30w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
	b=T2uY3APV9f4PQYjZnqyPAcykiH/NBGlVVs/bGEsaWnXE9o8IYLngpT6aw3q4WzIcv5Zi
	 MeWyd/jkKh5TNMibz3QZUkQsLm4VBsSKgia413jwbP48S1depDgvMUFU42qhYOsMmH8Tn
	 i3CYbdhJgsB6qjy+8jjNedeClQ3K0p27JZ9uu2ALO6xRLBMbIQWVLpBv8UmKXm4JDt3xQ
	 YhPojuuXCsfMTmfA8o1i4IoXzEgo4Z5Vu5GQ6nfuVFnZ4ycnUVPr/Imf/py6V4wX62i8u
	 U8KOcLih1Ng5q/TKL8tumi6bZVXru0itp9hQfFwUVZ6kNclfKzjhVAy6E8Li0yW1ihQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB95606EE85
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB95606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba3rp2284306
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 14:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=; b=gchuXv8rO9edzX4k
	9qDs7/iWqeOWA9XHdem3GvBvH613UiaHaQ4a2k3XuXl0vIk2+z09HP4L/ognem5D
	o8Xeue245re7R3yoKngvcRV1YcDMWvbWNF0j91pIJcumHa1wM5ODziKFoYFMiK/8
	LkzX1OmeefktfarLz+A3xY+nQHY9sso7EDRd78jzV9nFvR1jnURHIoqeQmARzK54
	FdbhvYqw1u3Hm9ieKzdPIG5R/+p0lkJvYxz+IwcBGWEGX1Puvd5Gm2oBaFfTuVD+
	GNRE9SLfjmKan6B8yCaF1PRHfhleWIBYdcklOPmFFvxKxK72c7zxHR7WUaRjrgzj
	dVO8yw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s057-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:04:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso568418241.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801075; x=1794405875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=iOq2hzB8ZIzAL0kATvijGaEyYH0ZXJ2EDRzy8FmBZhpsc3H5Nn+KlJb5Fxynl4CTVJ
         aCMoRE3jkUNa1MGQU66Yc8TZDSMILHk4oLNWsAP9C/ZYOmAi94VgUQjPboNwcLoLKA/+
         ysPF2FPbR1FwvEp4zFRJS6xIFkD5v2uMsVVjmUK0KNy4JtnrHz/hVboOYkRugEdhJD6u
         nHSMTLFqhksHYOehdjfFGEVvuYoC9me4jUoD9MUdTsUZyPSw86b78uRO/81c9I5/wKWP
         4fNUmfxX26nasD3GupuU6GkKWyiM7XygbkK6dIDm4DaKrBKZWvIWqVszAuoo0y+I/UAr
         0cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801075; x=1794405875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=PjijpjDFMN69UumCRT5XBDdjyBI7tdMQzoIYNiWGbk1kZQcCfkZnCJvkDgSPLtWZ1K
         YU46PnYJ69G1JgxcxQ5L/enh2BFCKfzz0M9bgdVrl+0qlz5wCwHu12s1cjJ0K2iOn/T9
         cfQ6LjnlddUndIvMjDEuMW+h+yr/S+qm7uil26r9MWgJHnsGeRJzQsnuWbTAtMyuCk/a
         Y+fBuXkxkA+JfqTsxO0CzP6/J/hXYRGgCZ9NqmyBlqSIetmK+yHS0HDLHpCsZP8c45/5
         gI/6kj2NNSH/ben4XAPJq3+4YboUw6RXFOUQxBwy7OEQff1uitPpip+ZAOebAvdQKSiy
         j18A==
X-Forwarded-Encrypted: i=1; AKwUvBzJpfXCeMJtJq9Tc5UkvjMNM7ygwzavBDHEy4cETFFU00lm6OvK2iEum8tEbaJlCrDbDlE7pGw3J/cy@vger.kernel.org
X-Gm-Message-State: APuU4Z8bI3dLglBUruhEBcmvkdspbEvPeQueBpa6+CrPgJdOCcLDm9fJ
	dbRwZW9dYzpZjRfEqvtPQUiYrC22o5QID0/TMUPBmoh/Y1CgIPvw9UWBB70fcchx1fDzQ3mMUMQ
	qhvz3EkfQzX9F/m+B/YLxo1Cf3fwfze71RW+H+vfE62BAnb+OlK9+iAyBmia53P/t
X-Gm-Gg: AYBFou3Fu2mTApufkbGFvvVeXI1aBeTytT6MYVeo29RscqnQa2GGuT6ua6THilXAQwH
	tv/WJVCB0dE6duodxWatgmB5XlkD+xlylM1zyz37r9p516+q7GxVXx802zoDzxdxp/aFSpXwJj2
	3Xlu1rW23uQxOFipbZZdLOJW/izu/QGSKTGF1eTtqZCBg/Be7H9nHnkavwW4G257LYPjIj3BUr2
	65beSFOWM5rvuQPfHVT2og7S8Ikt0V+piB9yIF0EMJIByDA78lIGaSgAQp8oa+I2rov+mR/r4VJ
	hnoBaDshSq7lXjKOfkUnxBuj3AcLpqwQKWLNFs0beMgs5M7p0FklxkeI2ZIq5/+YgP/SinpHmlm
	KUSRDsnUdid3deyJQYXWYuzoecT+oPq52QOAHe9bqTfwTdVT1a3DICFkFJllquDgHf8roNt0mzO
	62Mw==
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314493e0c.7.1793801075059;
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314419e0c.7.1793801074572;
        Wed, 04 Nov 2026 06:04:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:49 +0100
Subject: [PATCH 7/9] device property: provide
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
Message-Id: <20261104-fwnode-for-each-prop-v1-7-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CscP3j7PWUDfKaYGcKxatd6g2T25BK7kN4l1KEUd28=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSs2vnFhnUytszIj7K0MWGPjj4eH7eynMe/
 zjl1O2hEWCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 wxbqD/9x7yrGNGnGGwHE/5F84SboRgKxOd9v7VsB83upksyfCmrNUJdCvj8btxeeA9qzgCSClcD
 T2+FVNnhuq+bimeEhLsXJVc5Mj/CfnYLlLf2HjYTBw5XKhY77RyYO3/zL0ion/h+N/o3GU/Lhma
 VF8h2/k11CBVzYr1/hKVcN2UC5jnTB2dHJyx6lZhWY/gjBebAny99BGE6EyfNNQLD+HHJFgqtX/
 C0uKfmTKduexOOQX36t60DS2U2psmBug0DC+dc4AXDLq3lbfkgndojubKYsuBF0p+/D1sDt0zI0
 ZIruV+1C+7YdqLbPhKHvqcweY6qAQoQn6IFFQnJJD819mEy47NLuqS0pL+SfoZdF7UpNz8G0FrK
 fdryDWH7y14b0ytPPljq6G0ngevcTwf7meR0wMlSLH/HWzp0doxh1r45gpfIzbU1Sg//kXPHGMH
 iGn8BXYBDykkG/EysgPwId5ZbrCICEEpOUVEi0CaqYpNfiLGCvLIht1Jwmhp4NgoesgamhlX8ch
 UWI331eV85JS8aVnHQMp9Qd4WdJlUN7LCUSDkEwzGKUa341ySKsI7OzA4xdmVhWtsUoLSCMGjQe
 aNX0J13UCtBnpMjdzB/6iszkDHGi5e0UDr1TJjXcQAMUb5v/Aw9JnI15RStkZJ+fAr6N012X6iK
 zmmFwOT8akGpUaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b73 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: RsTfiM-NAkqRyhOeyqrtTBCyHvPhZ0CX
X-Proofpoint-GUID: RsTfiM-NAkqRyhOeyqrtTBCyHvPhZ0CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX6I+s4wnzMHRr
 vb8N64AfRVXA4UpONypMp0hgB+9YINmUzIjlDwGpDvEajqFJWkvGj8XovdxoDOAU7+2jqqsuAnL
 huokuv4ZggBOJ7PK79MFhc/lxoBKJcaeUgpOriYFY9O5arGVXMSvOoJq7U1tIsaPFvvXYdzNOQw
 mgcXJzWsBQg/g/7p0O4ZUXZ6xLjYni/2/l1y0SwDUKvgWLqqLSJNuIU3vQ4fWU18OIF3Nr7Ksaf
 lV79Z2o0A3O7hFGhkjiyniF0CmeIeuOvzBb5vJzqURKY9NyZnLJR3qzBpyAss9Cgfl3tVFv+UMc
 3woTd8UDSYFlDC6wiMdfrz+tcqBmF87TEq34Vd9q9Bgt1l2Wn/qWHs1yVATS/PiEK3y7R0sJefr
 3IBvBVp6pRPb63AFYilmR1b1FPQQ7TP/L1lLa/qEA6ORwuCaSWNQP1cMkA7MHQLqG7XFQSUnI/q
 bIC/wI50Df1Anj2Lc/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+DW2Q1xqR5Ad
 WycA3zfOke+qdfQqLp8QkH3kfeMpqO6QojjJABf0R6cVf6pheJFzRJ2w4Y7Xxgy6vPXvpOGVaFi
 hrUWWMFnWA26ev1F9jAoxQbNiFG56rM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7b0df3dfae53b6377dba91330aac746684e8adec..259ecc4dc31a7b07e2ae5f53aa2424de54ba8236 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -654,6 +654,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
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

