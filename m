Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801065;
	b=JdQn8fttp/Box+1nZhDdnG8bxNrI49nGqLOQr9aCuGkSJnkHackWK8wKlbD3qrQmOU8N
	 QMgdDl8FLC4Pen6WUkdRbzABlFhawsUGDjodp7UDbTB7z1LzYiOyaUiECCytmmfCD3+0o
	 7bxNI8dMlCaK9aQ8hb0aYQonLFOtVN5W3bKwx9PQ97FDUWCzh9cmAK6HpJ21QIBJMA3xB
	 h1B+gWqlCiFr/A3xtp6jlfk+v1WxsMJGLs3i8Pn6Hp+sKRpKy2kaR1go9lwwtEU3qxsjc
	 5ScEwAXMASF2o56Gje1QUqDM7vgML0gctPt1h44hLGX3oleOPbIVGWXhjbtxLcGbDcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=ycWpW+K68NeRKzHDnJhFidRrznovc01sY+QFUfGnJZcD/6eAqojCinrFt/n7GEh4m+aL
	 nWOXxifa5uVuNnn1tUnaiB9Su6PLgXLztXkrgf3lvbrNfiWlJMJ1Ddt55nWjOVuQ/jNlU
	 nBjWjFBKW17UJXa5scQYI2EUzwm9yXms3RWwYlH4XXqbTZZl6Tb8KRXMpclugn0V5X7M7
	 pFisvC0OXfwwEDgky0JkhyKk5WcfOFI4u3D/jA9/IqCKcH4hxR3HhCN9n+//KBN5ci+Bo
	 8XSXpblKZiQS3diGxqbOltVBDNiTOCXEaPBJbhSUvoPmU1FAWRl3HT1yDE60gcxof4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7821606A32E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7821606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZskL1700278
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 14:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ZyMWzQsB8somTKQ4
	gMi3RoSQ0KBzQTZE959mdwa0DCr+eXsvWQEDJdWxLa7xLthPcip4E9US2RhNMUWO
	vPOamxpI7QvNV51/ZY8ZpCnK/10yZlknDsWdxAzy1J6UcIcgAivPuTHQK+lgPg5Q
	PhPIaSavgqP12V00C08tkIK3kBM7Td7NRc+pKl5bjpgs53iwESuA8GApOxK3Fo5f
	TH1Zqaglwa9JC2cChxqY4URyvZkKBs+gjb2u2M/2c/bNR5Gu5giyKwkGrAM3gRjt
	ZTWTtuVKqwXtUxboWAGuTMnYMAjgK7eApbNceCSHyq02GsYomazYmOBkFyUucd/H
	+4Az6Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygm6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:04:23 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac6157868so1359719e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801063; x=1794405863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=Lw7IjwjwbyDdLL1zDhlipkDiIL4B1UIHTWQypEGAmDbK9yCIoLEjpiaOqAbE3+P45N
         GS9rbn0Z/RM0g0xwqWXSLXpSgEOeXE4yIRmHlsw+WHoVvebQaH/bvCNE2nUKizWRDuH/
         +A4SG/xIoHOjgOiuGFUqKcAPUTh8+iIXleMxBb+eKxO22KDrONLgWnh6/4FoSxuyFDEi
         oiaCiuZqb7dvoAEo/ydU7oH58XoMhAys/CtjdSrjKBfY7Q9XaslinORWC9XINlxKpfJm
         TDzm4LYbkeP7qzkZNJjkGrPiJqgZTSnV23XAvI0wc1GuPWui+MAxhHBco+0szR1hk6DA
         I6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801063; x=1794405863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=1EnHIOCWtJEoSgEVL0eiya54Qx69bpsuITzq2rRerXXy+k+0y9MpRLIlJ2TyW3k40S
         mFHueInuon62ucuqEEaIxGBMe/tZDIPscx7OUNe/4/pdjfTUi0NunmA3a46m2v5nKlI5
         ZYVycDMuTS4jPjfESr1pBBWLv0aifLmKo8saypj0wACw+UMh6GOHf49mELX95xDk3bZ/
         i+oxjsIWYaU65tzOi05mGzDjy5WZFj5Ef79o1rZWVhoo53D1Ykoo2mgxPl5DMW73lCOT
         fvgOx57v4okHy+vgAj1Myw71uAhexK5JBs3hSu33Z2KSHU9i6bqU/2CWs8/YSW7FA98D
         8Bkw==
X-Forwarded-Encrypted: i=1; AKwUvBwAi0Tz/T5RAoGH4v7/xunRBi3+6dOW+XeCdK7WVswPrgCKre5w0+tpbModi9VMRl7ZAZKG8PkRWlDQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ed2TDkYLWrKeIP4yTq0y6UTunSCatfmtnJGJCC4NZiorV0zX6
	MY2jFwOoimYWzrInlCivYxDDL9hrcued6F7Wk7U5Qwqq/InE+7w70i+enUpqKWK/b+FEb3JSkrA
	8AdTy4xfc1usQ8W3QIxvQIZnhamczy3aGgJmBDTrsf0t1wiXbGZo1Pr4sy9/jY3VD
X-Gm-Gg: AYBFou39vXGAKm8owChHNrIql49Zme0lSvFyy8aEQZV1rbuko2AJ6elyLwoZcw5YBUp
	zIPVhi7kydwoYujWBTK2qQitk77Ue/ODbmErLiPzRcFHmou6oX5smo7184gs+Onjqg6KxAuFuyw
	URMSXEQO2WE9Q1iL7rtZJ0Z7fbFdQFIDRxLuacpa0ylV3VBeh96+HLKY+o0jkRfhM5oGXp91KJm
	GUssHE0xWuk5TPN6kGAqH/jCRMnu8gN2ae8vD0/Jyr0ymh4VFPL8LkMC3Gd8G9Ip6jOT9HTzmke
	4UrTMhAyBLQcMniITVyCz3wMB/lGkDVmmKNqdac5Kz7FjgGF/tYj4PpinD3Hcf+E2pJZpKirNih
	W9Nh4EV/ytHAZjjFg6E9nn99sRp5d2r18+gjppU0Vm8PYBStSUHIFDkQV9QN1CHit/zfwnRAJPf
	DqZA==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306391e0c.15.1793801063033;
        Wed, 04 Nov 2026 06:04:23 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306326e0c.15.1793801062468;
        Wed, 04 Nov 2026 06:04:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:45 +0100
Subject: [PATCH 3/9] fwnode: define the property_get_names() operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-3-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSRKXWWkliovY8qVo68abtoXtQZqXdDFLls
 EQ9sf+1SpqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w1S6D/0b5eyCDtTat976om/WwrrkmeCrdTpgbsGvagClks0LTeShFP9+nuPD7PIJzrL4/pyP4M6
 osTD1xtFE9oFRr/JKicYaJUhGNjvhq86+P4Nk0irweouqKLqlsQoiqolxRUCRRKWKX/JOFw5UPN
 HwY2EWjrvKNLBv9U6+Nifpym/U8hKQweflNnRfIXMu5yaCEGnzB13cNCoSr5HL1f//BkvCEHlv2
 OPsSAXEeenUZz0HAqp1+xs49AiwTwDocOsc2pYSH5fYgrlshGj4oIr539GC3P6v8XvTk5ciwE21
 8rqNr1cD+xfY0XRI7qsGlSTq5nHwIkmkZMmzCZvCFemTxiQ7z+VZ7fi+sKJOjXXDcDae7+6ti9f
 BKhxyuCoZ9ZUZEjD+bi6CaZy0KjDzBI7MkJ6QkbfHnxjI6f7HBgQw8Az4RIb47ydJsP4RSSktaT
 ycW44vOZJCTTGF0I8DXuOsC8RkSLV5XQYK9ZwB3eg2w1ZK2577lrjRb28GuXgAwUP0K9smBW2/S
 05FciAVt+9P1WzFmvql+IeSba0EOXnj6DpiZDE0L7EjBVvDlAxtiJTyKlAfGM9HaGAZtOew/agm
 7GEz4McYIbAFzg58gtwRtxBmmwapSdtihU3Aq16E+xr+ZxaM48Qkdrw6gtBtwvCisnZthkFavFb
 VxhzvSv/E7NtLnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb3b67 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXwj3lOdqa6gpX
 fi/POw71xU+dQr4D3vttflzbYiz2OPBr84LyUtSW16AEKyyVl1Xzaa1QBvipQcvzwZIREivXPYe
 gN082iNwahw0aWJvjV5llbg1lyjH3AZoAmBngKl9izD9J9VG9txdmPlKRKoP6x99cI3tUQtTr5X
 /7h4YXMQvbf2GHuGKNqY+w/RMYc0SeXfWJQndBG9wt3wSnuWsTWIh+mo5QIEMQXZSEYcntEG+RQ
 d5IUqsHnJj1KwuBS4jVtha2nCZvqf7YbFNHcI4Z/Q566uB4jrmVnoTR8OJN4k4KkXpNwZ/aV494
 1ayoPhHGHS014KjCmXpUJbygJkbYJBbIv56p8ohQkyyVuXXE6RzRnSFeCpQajTAgO+YeKrwWNso
 x6+3r3D02icyZ84pgjJCfITJUS5Q2bMDE2ZA1zaoWaqEkj1ODv07jefZgMyvZ7CNqlQP2lfmtxc
 dhuHCVdtMIHIoQu6RCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyH8JxXGKgJN5
 BNxTN5lcPW/9+Hr4jOAdDE9nv1eyNJfgk/dNo7k50ZhgqHnt1+nMvtl3I7hBia8/ugFCYTWY33N
 9SD9MJmBDYs8G37dsJ5HuYd1wk+3BXw=
X-Proofpoint-ORIG-GUID: WnJs4kEPJ9CmO6C82Rvxk_SodVgc_ANq
X-Proofpoint-GUID: WnJs4kEPJ9CmO6C82Rvxk_SodVgc_ANq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

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

