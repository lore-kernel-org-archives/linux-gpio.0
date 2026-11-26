Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685805;
	b=RuWkAfI9vmHqFXzydHoxXCdwDtr3DPkyyD5rRIzHNQw48CzUqcVbHsBpCpEWwvQC5qkp
	 0P6QSD/evkHM4hnzuXC+Jnhf68mTF00ihJRbKg3s2S4UZNae3IaP3d/ZLJwMB+NUgCWlV
	 xrNd9w0uHuMUHAQvWk2tCn5P5Z5+aUyW84fhUlpnBNmvjcJc5SgoWLCvVm63nfJVM3s0l
	 XIys1eEC5oaakrMPByIG9U0Ogyh5+1mOeibjqJycPoMr/gw+g/faclrKhzJLRNwiXVcGZ
	 JZ45HVz9WRTzrr5kXEWDhL8sMrE6+GzR/Vz/UTBInT31Ckw8LtwF7WJ9b8tUY4Wk8wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
	b=qTH0KMiexMK5LA6aSG+wv6ZWk71fnS2+lbBgvi2zrJg73PJwdsLfKh2bwEfEH9fnap9p
	 mh6VThaSAsJjH8RHZaq481ONw/Hn8JG6xh89Mc1vz9OZG0kK5h4/J35G5ocZm0cjuYCL/
	 d2sMxJ0Z+xFDiLPa0IiIjTuqs6Azxk/lWBOEqlXb1VKU9Icl2LVhEJZnfd2W7NLkeNA2P
	 D7iod0ukPkPGbfM8zKBjELzne+ADAGG+xw0yVOYTYzJndBi7GYQ/1V1MfNipGp2UCinkk
	 QsXiM9C3HJJefZG93NXGgt+AZsCJSGLdiWKClYBuFVf9Y7SFXMSfhBQHck65OpbFnSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jUiL6e+/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6560A2614
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF6560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUiL6e+/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvYX2594855
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=; b=eQ1Uzgh1R3dpWvBQ
	Qc1BxFchNB+lggK6/aSLkCJXgQB8mMrq04s8FkDGJx7IR31VtdrP9BeingYme7v9
	CIwFYaZ+Db4vgpadfe1o0FxIdiy22Avam88BShLDmrYBKASLQsf7pL8NnGyjrsu4
	m/DShDkzCGeC1cK6aCcKuCI1QwrHKQDPt0SzIZokbdg6/uKJ49EXNRxIU0yj/GC2
	puGajCDeUVliAZBV9w7MbU41SSKqDrVwtTJ/Gph800ZP/+jwJc9ZxLcDh4Pgtt/N
	SocD+g5V5g8UzVfPbXCnhyWIpGJlK4eDdS/kYFjxMfKUeNJjJiEmn3uLOoumCaG4
	4cVhlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sag8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso756425485a.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685803; x=1796290603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=jUiL6e+/7go+N9aNbHo8OTR90sNuZ+AhchS8yHCp33+qWN6GRqKJn17uMmUHCcEtcJ
         ZPXgVd0MKfFtagupSC1MTepGM0P2KuxtcNVNVKR+Hsi//YLu+DIS4LSkr+5/n/Ri4BWa
         v1Kl5w3CU1chNALjSfCe/mY6epSXmeWKdq0F8+lNsOyNbT7PL5tk0sZm+1fWruSS6zOv
         t50EkOFIVx2CzR7BrTHdtJI1ovICHotoScOxMkqLO6zw9Nr9dRxYqm2H1ktyYQ83A0mo
         PIaM6TLRUwLUy63MvDSei9e+uwKvtZMV3O6H1n7yYULlfaGnH7azON7vsDKfS6BX7LL0
         Uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685803; x=1796290603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=Y3mITsmzEVAlY6bReFllUvbIdnlYiwg02JVc9VYTlbpfUo54GsJyclpertl7F0gnql
         U2n4c+STk+d6sDq3eEJtr8iWZqSvut3ZeU8OGeuZ+98238IQVCz1tYr8EDB13lQJ5MO4
         d3h/1/+Qof6E9zcuDBHX0ex1gnd08GC5kpkfsyVfoFCRHwqyXSwMWzhVjnBgIl9gayQ4
         An8xdllfjmHwh5Rb+4BmWDYkZSG1WD3k/AKTbIt9J+cWrBZxPxk2MD8OW8v5IrqmLxZH
         25kNX0Dt0YL83/dY6UQn9pFQvBRvvf+Rln7vH+gApvmJ+CFWihQolAPOo1y0VG3NJiNr
         t4tg==
X-Forwarded-Encrypted: i=1; AL+hErERLU3IPWWKxH842vovdc10jzgLjdxfR/3cQxvtMJl9r3n1K02rbVeRr5R+Xrt9H74LSKwZABtavDF+@vger.kernel.org
X-Gm-Message-State: APuU4Z/pn/58MFNuazTKKR4MOXn3JfAAPdqDCHeZ9r9sF9C1yJJhLzwD
	ycPjCRqlqfzameqAn+7xDPvOSK7t1Y9L0p8w1IGHQ/OXSPMseScg5tsVAwluShwmOiEBYrXhqwx
	EnwDbZ0THnOsb0+X0k2VUbxGCy/F69zf0zAmom0sJHzVD4/hl4lNXYUYDF6lru5vP
X-Gm-Gg: AZFdTZf0/akbvTBCDnEEOkMoeVCTssRE7pti7u0BTBAjDyj//rbd/blomcPePISu4KY
	qykC7asQGo7OxygDbiRjO3Krj4Q8r+tSvcoOUARoBmpqyrzq+bdT6cR+HiG/rdlE7XEcBbDThCr
	apQcZ9FS9EPB+ui5Bc83Zh5t0DQrCT8kSk1iAaDugc7UbX98I94SYSqEYClUPc3VjLgryeqkfaC
	A2fD023MdVuY5cCy8Zsm6+w7xf+MsZaExlZMDF54gZ/5NGS/rABwiUXQLgOWpXZCKuQQlzrl/GC
	IDEzWU1UZg057/QWFIZo8DaPmtqEODq9gsKOqy23MzaLmEPca8eN/J4iohMqc4/B0RQAem9ZvTB
	ruaGmFjdKQKLj/EWJO/eIfk3beBy4GBWu+zuATCQX2REtI5tPdYijizLeLSlJqDpQswEmT5ikSc
	JG9g==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539865185a.71.1795685803053;
        Thu, 26 Nov 2026 01:36:43 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539861485a.71.1795685802479;
        Thu, 26 Nov 2026 01:36:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:25 +0100
Subject: [PATCH v4 08/10] of: property: implement the count_references()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-8-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpHcZaLg1iuY8wj6IMHjWOG6qRHq+3ydzmu44JzsEu8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UJXfVTy+LhvtNE560ipdr+7qsCNpwsh365
 sHEwfwrLSiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w47fEACiduOFuZ5D39+RtQMC82XPATkIZP00Ln/9WqBR4IAiUKBKohur+TZsFpIJzt9wOSyiKaM
 J6T6Qf6Kf0chV4Xm2uHvg0kLvQffYIqPPgkr399d4uxYBFqMAmnXEqsIl2YHhozmGjHoK/CLj/A
 eUEhj/wL+RE3gjCdm2DUj9G3cWRLJctMBZQzoQjiGyXgWBbPlfXpAqqOJaYEVdBGu9mAVtoV9+M
 m16dtpnDB2JPrDq7YmukkIxiU66d4pwkUaWfk0O8vQXoWs3Zu37knwKld92AXaPXR/x9ABBN5jB
 rUJw7rtSfVGIN/7BCBxgZjVGeNc3zw1TnKz8yKdLsUJRNlhUsKCCv+MelNjEtGjuebWIRlkqGWt
 d10L5ydRJQv7o/CJkLmXM2yrxMHVhlCJHUwLnY/p3lQeUGnhFIo/YxkaV0p7aEP+QAyaE6lIGwy
 3j5IGagl0G9WX/0Jaz3lKs6SdRdmLX5UO7+EEoabQwBvcelQPhNHYe7A7nVfcBcCyEnZzk+zWqn
 mZ+Lv2dyHoDY2yLPXtmGr55DUaLdOyYLbl6XjXE6F/anA61Fw44QakDHCd5c/mbTR3noyVzBUxx
 s2eTq5/lj2J9kriliFpQukiddxj0GPcE0x2hIlHDvsAkI2HX3ZPofSHrm1mHNkCIyxPaW7L0vno
 WIhmYhAYEomBamA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07fdac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jM0-U6AuC959ZtbCfPn8lGjDlxwSSzE6
X-Proofpoint-ORIG-GUID: jM0-U6AuC959ZtbCfPn8lGjDlxwSSzE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX6/riznu+pXxM
 vruhSxZEYmd+QnsUS0I2unP40C0A1Ubn2FoU70aUA5fCZR0FMIQUMhPneyPw8Y/arRI3t/zRIlx
 m26s6mUmY9/L0qNxgmzFWT7hMFmAmunl/BEmkQftFiaARnUCO0ddZSHe6uauxnghnb3zr5ELUse
 LIxmkpXsAdgm08Ox/LFFYJmhPcOotmvG3+ktZ7kBR5ChLoHfAmZ8FSbiBDNQFn1AyJCrLZ3pL++
 2dPglotNTL4si7w81mLTmJd588hjMg+w3YGEyPabgy1ivbgIO8/QDFZiNX/k1hTQZYqkyHwtrWr
 gsAHRazQx9EDyd2hrPEs0gBOyvpm/T6+hpCcblMIfjShS+y7SmmNyzGJyGTffkJec1ZsVrSNdUU
 /nSsZYq+pUhfrBA8mFxhZk/CxAfJy0D4bIqamJ9Vzm/g/8ki/1vm6LWh5inCRpBBGBxciRTQKzW
 f+fX5evaKgiSWQvf0NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX4JhULiSQXKWl
 lKG5xUg0Lf1tSfFlUaORoM3cfWIP4U75fKmM7w/MOXSzWyDfsghou7PUmYIkOQGz8v8wpvgkiwN
 X160h6ulR0BKxfVe/2V/iGslgxtYRmk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 00349e78fa51455696d0b34ee02ae55c20cb23d6..bf2e8ada7cb32d28437174b0cef1fb5958f2cefb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1233,6 +1233,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1774,6 +1780,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

