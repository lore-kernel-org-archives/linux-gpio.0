Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801084;
	b=GyewOx7MpH58FnNNmgiMtTw/YvB38C5yL40kscMqZypdorDwlJmRdMFbGGmJY4qZzYaT
	 HR68kO3IsiD8XzqEEJOj7WxULJmyxxLFiPmKn8mFosATizEBT/cmhGMC//rsxk+iauPkE
	 x5uQ+lWvpc1opnqaAzjoYAxY0hd3YvULD4pUvInMEeE+MgGr09cjATA1gpsZl8nUjCP6C
	 x2DN0Z9KyzqjoNYUiqTY9zfX3Fwh7NAJOcuobR8R3mPptkxx96uRSt/OcV2w8x4ilFUZb
	 QejKA4sonS6hVosCWPyCyFYuqcMYnmG+g+3xpJMEf03j0fU0nxqc2WSE5NJ0Box1iNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
	b=AwKAnNhTsVWepfZRlY7HnDinHLsg3atbzw4UxOTLju1+ZkF060g9Wkdf129+yHOGs4Q+
	 V/ap5yKrtUvrC/YfWAWWgT7rrgVCZB9OLsAGPXsOujGeGS0Nml8fS3VxK7v/8voUEDMBY
	 NlM4ZVn0mANge2314blkza1tqrQ6KKKNF8hZGh0k7O6sO/IJS/z753kqT5O9DyxmsrdtK
	 lo/Gdh0OGVzYASzZrgesDX3u+KW1hw892Apfcf+SiQyvn0itu7gW9HMqMwFteRbvc2FE2
	 BjYXqNUkfcWbPDopk3AdShu8nxieFiH1BTKsdq6U4o33OuM3/JZrSGj9v+8SXr9hVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MVHY/02U";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5CC606D81E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5CC606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVHY/02U
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsZs2667761
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 14:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=; b=n6BlCfAplDkRIGJY
	OtZvEiHnmJxfVXUqgCmbQ3HY4qMos58f49uoPT2qpuxiyvNqXiZUg3EAZ5KwManW
	X/P1irYdeYwkWlRqhibdk0ToPW3KLNnTBRwQTibR6cnH0c2CL3909RF2qxFC5T4z
	MRmi9u6ZWWSk4u5RY207c56jDfI53aj3If+toqprwFx9Ltygiea/igBKX3yIXB1z
	2ASo1yVQ/7vqLDwKgTyjFS0FLODgtQOWhBH3BwSI9kvYT9eMd0/0Aucly+AJ/ijl
	ncAoe+ZbTi4hAD4DoJLZaXlEQGcrbpqC04GepOi+liW37GrSLDaBhRL1d4h7xKaf
	1U6CiQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmegt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:04:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab0467c89so810831e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801083; x=1794405883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=MVHY/02U1YnbhBdihaUddXhI8vHGC/RsQjc9ReuzGEDrsMHc7NMqntJ/DZygd9dNn1
         BknVygqtc3e43JkkkOIMdbiqJ5Dp8JkJZ+jxQFQW28rk4RnD3IJ/4B52dxsVZaUJjEGX
         NsuuJGEYyFo1Q2m6dTXSwkEZhVt8VmPEMJIYe6gJXGC273M/eYYUBH2KKGYdfAUbvLan
         veu8ogHTWupeUxd4/AfkiMy1/z9RFWzbn8XnO1LfawY7IWUmndPEm6fYqV53v4BXIm5j
         3kmGfyT8DZxHOv9alKegR6VGP9iNd2Du95qqFSZ4kBxzdbxtnn432WsRoxPkg5SvnLZd
         6QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801083; x=1794405883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=iBozZyfpdShPZB5TZKi+RIFKtd3I7CkNx2xpgL+mQmROr+BFDnUVYbxnwcBdIRyETr
         SVdGXMQZGTKJz64aRUTpHEUJXbcVZ5P0ic9Xb0FqrA4B4tBQCRis+s+YgkFC3TgnpYZp
         BRR7vkoYxtlCWCdxcy3Abac0eiJVd/iF14n3oE7sXRB4/CxdvD70GG70hMk7Aix4weg4
         cqZHXCvPSuQLqQfdPhEwiZvPqA3la9l+mjlK0JF2yHuAqCpBXmqmrgYeYbU5MPTbax5w
         h8939OSPcx0gAPPuig2WECXAAz3ZJvZ057c2ZQTwPhHpTjumA2GAB2Ytx5rchX3AgpnU
         IVEA==
X-Forwarded-Encrypted: i=1; AKwUvBwf6bkqZO6lw1xNSDDNSWRJ4IlQsFLHbRBq6YUy0x+db05zGoOhmFiO8pW+HnzOSQhfFizjwJ7i+nsd@vger.kernel.org
X-Gm-Message-State: APuU4Z/fe5D6aRaUXwCAAT02wG52odwo9eZzOxjTi4OpFdYh+BgyjA0/
	JGc0vpVTqlhg/7kEtwfHweEvUOw4WOYeLlkHsc1tM29+oDrbKu+gf7+226FqSFJ8PQLxZwSeQbD
	flduPI/kO4F788QCMmwqKeHcTaQyeytOMnlpN+aibn6eVHzwFs8D2L5JxoiBl3Ewr
X-Gm-Gg: AYBFou3vvpZ+dfBlRZY5tAydXJidgfqWPsKhAkrsfTq20Is3LSyfvZhao1jpn9FqvtJ
	4vckJc88I5Qw70j2CDAMDD958gKt7YotRj0OYdhK2cI53Xz2cVgCWU0DGf+n+goRsOmC50GreSj
	NFOJcm6dF+DfVWRiGaoU5a/0Vu0c8eb3/eOefx6BRsVvIuvaDuWjAY0Zwa55K8zd0dXpbJrnmC5
	90XL9jPR6mMw6TtZyMMaXiPUCJt4EcCiPB4//eHV74d7x6wde2T774OLm0GUrYwJSmpuAsMCAbc
	E2WVZ6ntCyXuyVQ9RRAJdci2ofMGeqL3q9ZkOg7EVAAUhK8/WUsYIsENFV72DwRI9bqJlMKwBK+
	TqTocCkD9CgMew+8LeuAZAeStp6QGfJd7L0zwzhkpJom/NviKxFynkEUCsSLVjbgZUnw09BUyWc
	x5ug==
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593950e0c.20.1793801078038;
        Wed, 04 Nov 2026 06:04:38 -0800 (PST)
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593898e0c.20.1793801077646;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:50 +0100
Subject: [PATCH 8/9] of: property: implement the count_references() fwnode
 operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-8-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfcJL94RVspgN8CyK/snZo0rp9b0uidqlV9W3mfnsrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSrVGZJPcf5ImbusE8w0YzObuzDwHNwk2vf
 XWwfHOBNamJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w2USD/9+/oAE3ozJ0woCpNJfEKxkKc6OkP+Fp13bf7ApUWvG71blBdfNz430uIpxhii9lx9NSHF
 H5yKot93opIVe4f8X7I07vIwVAQBfP1dtTdnVWavMAELyhSWVOIQX2Lp3EFd4Rtky9afjzaw5CJ
 n2zulXoabInrDbALeCiYXy7xfflbtsynqdIjm6SLgnLpb4SURUSTbySU1yoF6hIZLyU9GmQ+Zm/
 A5D4lBHWrYNUZL0OIcWQvWX2Rq/S98QJJAzublBzvLUImTHuwL2SuDBQA/qMIjc8oKlukqHP+/l
 QGKLXZ/T5ru2K9z8VOZXMD6tyZBzMrVvhZSIBS3UqsgNlS5FSNVGiBR5bWprnwdgXI59W5smAKT
 toEgXdyTdb5o5ZUIziSIfpQabmoln4rKHRISWIGZQ8WuqucOi1iVa2XCEQKsUkLiy82wmALNRKD
 uPDnmLZQVGnDdSWcMrHPAQ/qWTFNV4K1lClnzSLHITbCd5uM4piou2+lxdYgbR9X36K5wP2jxS4
 areuRfuUDSYwSS/3EZBlTtUolLcKcPFlfrgY+TPvIuh8EPLSKz5Dc+BGF15ed3UqLsy8M2yU5GU
 GxstGJJLPGB+wYvlupd0Y9JXoZFvF0wuLIWD1XqR7FCCgW3to2+DXgWre+0LHZF5xUFVpyD9SjA
 YNWIV37TclMW99Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2DukK+kT76zB
 85ms+EncqcjAxwURl0Nky+egcgey//JCM3wDMUZeKsoiHbDr/ToK+TulzD79Ji2MBYCFswuxf3G
 hhH4faRQmY6AK7t8xY8WhDLG7tgMao/tqY+Xcfd2s4qb1n+b7oVhCTP9loQCdHI4tdCTo+tnLOZ
 aSV7Wpa0Jyx2AmbDqB/LAiej8pIhURovEYs1WULefx/6Ssgg0ob/ansAti0XZ5S/rI8jH8Vh1ex
 8uUxB42S19rPvXVhsVsAdllZ2GgvVO9GVHnOIeuTDgBkVp7IqEStQCxBp8SeekwFvuItxsADzng
 8dkntBk9ebq2QVzfx8qjVx4jYgkCRulvGXOWspaKRRoRumIoCqvXjNQ/5jZffLB9EBcbikHVl4L
 TOkX2g7hvYMK2RQP0uh3mDqrz7tPkQZx7bbNXmI6asZOWQxo+mptoZ8LlNVvxeduFAbUX6wtP/H
 4VNOmfiAzEc1ROSSLJg==
X-Proofpoint-GUID: 7JzXDwkzXQ1gDQwy3BX_kHEM26XFhSss
X-Proofpoint-ORIG-GUID: 7JzXDwkzXQ1gDQwy3BX_kHEM26XFhSss
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXzvJvJPKJpGJo
 QkcnsuTufQkl8BBIL4UlgdrGwF5PVIxLu8un4ZxH0iW8iqTkxNMczvAkTNocZKeXqJqTm5f6n78
 Db1SPQDIzS2QqHpN3ocbVQ95I2OHfqo=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b7b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 16c9c307633bdc7c9343782b1cd3bdb845552c6a..ae2561479e2382b241fd87dcddf52dc7f52a950e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1231,6 +1231,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
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
@@ -1747,6 +1753,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

