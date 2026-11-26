Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685794;
	b=aacNT+iMpXO27IrcidTE3+bcAjyhD0W6AfuQgUtVTHN5aRrWQzqRfU9EJF+xwHgwfPx2
	 DyBRyzAD0rUnKNpsGYp/rxyBPluds0CTNc1aKIX62MPccAYJO5IiiytUn461Py94jFdUU
	 b7KRmzJmGlYCgbtIfw8GzsWGlviCml0eQIUPXhfykJt1Qo3bxPPobctNfbeMMpnoOokWW
	 kiInOhybMvyLqeznFo6NxmHh3eBBKsOZM0qV5k9+jhrOYad00Bfg+OeAOZIzqbPeBl1Ah
	 8dJeehJ6R8V4xiAU77WndSv1ptMHkXEyNKpkx9BRAq2ynJm24oy/E7k6GJ7Vm3955OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=4cCO/Bk2F/Xzl3HGJ2JvbrToJ2U8twpKk9n3wiYytVpr+cjwUOzmbDWtQ0QjaiRwYgMS
	 LnlW9mB92T1bThCNy+HysBjkonnfDkGs+h/4oVLmjK5b29PXe0qiJMWv5PP3bvx2WrIM2
	 t4DxAbiRvq9QEXgtShuXFgvPTtFh4+gcY7EVVA5GFIuRtPlN+Kb+4qnPXDfSvOxyiWbdR
	 lto9G68xZd7oWTar59kGHqeBxM0RwNlstERh94qr6qyWlfYQpQx4yYkB063gNlo9R+lfN
	 tyTdHyxfAjbExcji+x0KQUrHtzkyEJOOVmCIcQL2CdnY2ANvM3UBvt8tt267/+I+hYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Snymp1tQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqYltUnm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21604606A681
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21604606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Snymp1tQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqYltUnm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9h43548468
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=Snymp1tQbwXOgvYJ
	UR5nPhUcqdlAQBfA/AWKoX50FuwBTMhKjS1B9vlClTdGAdjrfRTneHKVgzHKGGIN
	OpCZW0A9WHfYntR6yEo6+Zfrx1JOaGah4y6zuLChRb5cLJ80HcjOtP0ExO5u/0uY
	cYJA2iWbBw/Oe/zVZ+d/S4nDguWOkY2R7s5gz2uIC28MBvayHTlGd7IFjooqQms7
	WCaD120hC1S3Xtc72Dp4iQaVYZj6RW0lQNai2Iz2sMuefv8mFqyaOHHJVLIBsoZ0
	C4KrZosOPHr/V5M4AKDRVUhbAZTD4DF98JkqM7c8e8Rxt3kQWND5YKPfdGG1B5fm
	AXN+Gg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauadj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ec7cb34so39204926d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685791; x=1796290591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=bqYltUnmn6xGGNpBc+ItX6ygrt86rQlXOXsTMqgoy8lyix0GwrkhdAsDHUjN8jHG5i
         EVl0j/GrmhxK2ucoJgJTNWSNR9KENviZ+/KSLWV+2PSDePLgMm8eHWLk+a2EPaX8HZmf
         yTGIoh8ZwknXOrL4UO+dhf+hK7wvIzqsyHKz6LytjPJS6EHBLXRqNUvzOBNJjWQ2QXPR
         4TTK0Ekol+IIV85f0GMtP88M4Nqq4Xd3bV3Z5daUqZxfpOHnx4gXbLzBEEDrFOnZxBiu
         Xfda4ESH6HTVaeFbgkplaYViKuDC1+C0Tlpsay6yOk+ijBZB6TvBNkIEHDvfTYDFNMjn
         wqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685791; x=1796290591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=TUZN/M8GrXXZZMGQtHGUszgpNRyXmC2ZS0+WHyuRndBhzuAaTgG349rS53vvovFbaM
         feKhXhvztZ1YthcO4rbaTswtx5+4EDu378weKhj4OOnCDh8VJzsvJzEtlhQnFCXuD2ds
         zAGh3RfRB4ETMcQUzrmUS5JWEkMFbnedJGyXvk5+tp0gjvlnrTfvY2IK4XNRS2XArUVG
         NH4iJOZr1p5TFhmLqWZKdVWWNN7hZwmk0TncBgwV9ac+WkbWvY4mJrJijL5vpcgxGobP
         bUEvon8ZcsBPgkp6FDec0lQIL82YWXCVPFs1SIdny9+APovrI2rSPFp7vr1SbyoTDnWs
         2j0w==
X-Forwarded-Encrypted: i=1; AL+hErGx33DhLULZBmqTbiA+wuc3JectJ+cBi8dJ1m5bEBXCOh9V0W3DdUHzEfNAYVmWzejN6u4BqEvE4mEa@vger.kernel.org
X-Gm-Message-State: APuU4Z8kE3tBM53k+a6KNR+Rj+cLWDu7QLPoBHWiEzeOj1iVXamn8ZCW
	1jewGRhZJGgLydc/QTVb54N73F4FdNzfjErVWoI1lTeE7CGgy3uUsXZCLJQHniz+gZ/257lYrI0
	x8jy6w2XabU8AennpHVbd3ngNrjNf6NxCKoa0RAgOzliGncjWypsfF8hGxVVrIxYs
X-Gm-Gg: AZFdTZe9OGN0CmUIUg5A/+RQdMFLQRLnfRdEyzeOHtukdpS8PpcKAyLUv4HUfjCpRAr
	LIeIVCPAgu8o0lT3T3vMYKmHRPTvnlLevy4dNyXQXYkIe+QAGZyxgQcx/Yfxs3rMO+eaBr8rq4j
	HFe8W2Z649KIIP1ZB9JZxcw54zebogWTrxiHOaOY1ZOghjUc/W3cNvxuHhTFhBXLOhBQz73sdfN
	NkT/BvwRZTV3RXRl/SUNRC9ndTEQijWFFBWJeq14c3Q+5IdOxj+7APzkeg5KiiU5Mjy8fHdlyxh
	sb3yX5oyCXVWhM1zvVX9oJyQg7FZ+s7b9Dyvbu5ewk9ECIuHD4Rr4D4Ku41FL5JKBKQSnZyYHJ7
	iD2yKCljRKIyHdZ15jBrr5ZD18HNsbUG7C1C5DljB8WD2MSv57mj804vERjteejine6ni802Vj0
	r8gw==
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3919430085a.29.1795685791010;
        Thu, 26 Nov 2026 01:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3919425885a.29.1795685790530;
        Thu, 26 Nov 2026 01:36:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:20 +0100
Subject: [PATCH v4 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261126-fwnode-for-each-prop-v4-3-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2URr/jPQGWV4ocfEMBkT9vyzlP/x5z4nta2
 opKoVqfN+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w0t/D/0fV3KTiv5Oc+A8MP6rH8R6y0Et7IIXobjCwmd7NEyBcY3txfL71qDkaQy11JUqpyrGFXp
 wmq2DsCm+hTkcfIrzdLrd8IeaRTAdKD/gBgkQC6Eksdp59hzkduyoBQaH//86MdUnr7z3s9mEW6
 HO6elHnSNaTZd+7HZXV5pBv4ReQjOGdNquCOMUTzoxdWIjUkMhoh8twPPoz1GJHnhEPLIgRKQ+u
 NVsQaoav959uFzJ1XkfiBk+IohAHhYV8pZg55RYgtOIcS7Ix9sAe3sWZNf9MHC3xSV+AliEaXT3
 fl1YJsjgTSILi6P3ZbAkdUTxNysv/WWZjMiTmn3Oea/e2dFg6N6jbrHCvkMn5cR6K1KOMWQWBSM
 XicLTZV+QjLgInH+4ETZhSRmqGg0LQbylv927jI1QWsZb6eZmfBAwDwmYa7yHkLzFGF6LSCEP/C
 z4JZqAB7Oq/AJlRC5pshnXQMB3JVwIK6kIecB2XBZNk8XgldJkJ3i5tX3N/KaarkSBFoHVF8L2j
 2VXdXmm4AYv5XJN+w8Ne1du0M6y7H1h11YCgVxexWULoJw/f1x+0s8iuNnSLqW/Q+NEt8n/0ONE
 xyri/+3blUjWSUjj8aoP+y7FMgXvEDjCywBXY5oqO6H9T8mP044hz9PNh7BNi/nsm5Px1BSg2Hh
 AyMOsT/jZyQmkew==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX0qq5dqd9cKlL
 4cFc6EbUedjB0GVcYjzzzRYxuwOzGR4vQRVDtE8GZj6DP/M7nSVoj2X9ddLTQHXyjpxx56yP0ON
 Qt/UOCp5p9wsFp9W1GDNnnjhwhh+CTs=
X-Proofpoint-ORIG-GUID: GsU_L5KwMM_BWnGrpRoFV25932ENYf6U
X-Proofpoint-GUID: GsU_L5KwMM_BWnGrpRoFV25932ENYf6U
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fda0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX9aW5yi1Dpu7b
 xU+48s//fpUpsrsQotrccPm0Y+6C09y58cxCcDDr2LARv/B+RKM7Ij2RQkqkqfEXWCLU0FSYIHT
 MBZYcI8kFCjpm3Uv2STZAF+OipCQiAaYG2+Y5iIe5kDeTUyt1sz+ePbx8kdhvK2WJDfEru+oR6O
 +wczOFVloy5ZV31GYBz4ZaylAsM3U/BsHZsEBUCSyYIErWcENCd+IyevXB1uqUEx8EqSH4kGndv
 dnmoi94HbIDYF9J3rET4qpfCZPFDkAFZk4+jj5WOtNzp97+G9m10a19A1WM+Hfq9LT26NzN/6D5
 fBmdD4WKFRWjbkfHoosFqQ4r5+A4oqvTPL6ixZPUOXcXT6SQxRFUYlWN7P7tZCxVgP70XTqr0AL
 hQ3trzGQwyI2sezDFNS1NoL0nnUMZpiO4HkoB0THED4qaJe14hLNPxXzNJ8zHHRGRgPPjvOpdX8
 rf3QLRvmdQKIH9GTOuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Define a new fwnode operation allowing to retrieve the list of all
properties of given firmware node in a dynamically allocated array of
strings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..2d7e0b9245d445d473c7317bd27058abe5750b40 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -125,6 +125,13 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_get_names: Retrieve the list of all properties of this firmware
+ *			node. On success: returns the number of properties and
+ *			sets *props to an array of NULL-terminated strings that
+ *			must be freed by the user with kfree_strarray(). If
+ *			there are no properties, 0 is returned and the props
+ *			pointer is not changed. Returns negative error number on
+ *			failure.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -162,6 +169,8 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_get_names)(const struct fwnode_handle *fwnode,
+				  char ***props);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);

-- 
2.47.3

