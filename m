Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584846;
	b=CTjp8QWXg91tsW/VsmDRYA70eY/wSL6/ehu0MLnglAiIiNJBCgic4lPEDligAAXxB8tU
	 Abzh+sa/FG/paqE4oZd5yIrv8tUnE5QA8AYJMdheV/3cICGwISEAUPweBeRyTjh+Xej/u
	 QTmuSC72CYsQ4f9/VTTJ0CkyE5YiiYdO2pqjmDqQSxukp2hOutmwPCPiMZcAYaLPTWFAC
	 lXvNiVqUzTyFzsQ/QPJIjhbwkjvCfXgVBqeXNjHivTBZ1ua/uAt30Z6oYRGbHCP36PrGA
	 zDZVcHjhYrUqeF98FTCk3YH/VraoYK7mSeaeaX3exBtskIPTgrnyEE1STT1OJv973Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
	b=P2umwYjBO4clTqL9LiRH2R5GJguNdqD3aKkxL5NsRvtgAlZhu1UHPBVmnS0ZEcvFGAiJ
	 sI97kBkiBo3yZiBeATwWLpsCb7XU4o2OEF0EkY6TnwwxKJIwG3FVdFupTUUOJF2mH1lgU
	 QrZ3Zs1FGep9Wa5/MG9tQwBh6R0tkbvsV7/Lh8KPBBCZM3m4YE0aGt2SYNbG1Hy5rylTq
	 DQxLbojFpp2yL2dvv5fABDKtmh+UuAcMzezWyDIT2WOlk2sQZSfnIkD4FE4Ic3jPkoZeN
	 Xk/nWpkIXJltvAYsacUe56yu7mGBgmPqnr/A4DmFht5JpfN7/Jv71YpiMPvLjHNdYpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EoyJzVC/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20D60A3833
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A20D60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoyJzVC/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRdsc2638653
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=; b=iekG1suwraLe5Iwp
	M4S1mk3eVyRSu1rhTFQzNkopKjX99A0qeNpQjDdXsC611k2wve3nYNcVv7yRBAEa
	3Roh+ewvTQ5+dTQqVgKX+AD25daTjH3RFnyWUeW1YQ6sGIB3EY4UUiIlCFdafRwL
	hv+LqyAYbx1ejFXkcMSqrOwxhH8V/u3HSHad1QaUVCqZKPbwexJpqAJdbU0jfz2X
	WQkUgYIn1dbWCyrYKrdy6KNrFxZOaYT8Juy1ExGUtBTNd0+RJCe3oIa6ArCbD5oZ
	L9ogVY1HpbJsUCUnNFnaKeKQ/ynQiaFvjpl7/C459O6Cn+p7P9qOtlgO3TZo59xh
	UVfJSw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:25 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679b648598bso1430355d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584845; x=1795189645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=EoyJzVC/TB3buxg7jErJpRxJSLKJuz9g9v4bbI0K53fDYE4C2tXgUXlGOuT5ZQ3OeQ
         puEf2MpESJvJaEE3zqLLXZoqb5O6PBJkfu9g5O5HJtiCuZ2MwbgeZZRWH1c1cUgmWeKG
         ra27PECoiyLsPGj3mP0m+LSOC9o6tjR6/WxVp2JEZ14G/4+NIz6psY2j7rbUHPV3myT2
         Ph87oyxlWCsYw9jCxhrKxZQqrHaWdLzmR/iBEvdcXIvsh8jVz+HYaKeu4njcUVbZyGRN
         1DQfdPiRRx1FCbIB6QsIdIqsLk55yFWPKAT/B1qtQ7VhWoQ5G9FTcgVqkpa13ouifCZ4
         UkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584845; x=1795189645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=hD5t8Ol4YO+jknH7m4EBWBUWPmY3jyN/F1Q8tBC9IYNBKYBCZCBrU2Cl5jhf9HuUQH
         2OHVmDJ8rHuAwGK3hSD7qWKCtbAgfn49cOt3HnBypiumO5HzUygNe/IkGHLmcbpedd6v
         hT537HgXRSh7xv5JlzkSh1ezACKG4w9tolhnnwQwx158+uUSY4vhFYwBu+ZPF29gz3AM
         0Or/bwf/oV96jZ+XtG3VmA2LQLN7jSyiHQI8qFpKxVMtJxjQRUoa7OO5hHb8NRAHpQg7
         zWkTGP4r2zjlnf+u7kVzLGLXIJRr20Yd16+25jAvqU2OnyBmRts0z6PRHrOq9tvI4tUI
         AOYw==
X-Forwarded-Encrypted: i=1; AL+hErH2RU4lJfqcyPssNnLyVmTEEqfmmv5CMu0jEaVr54jRdY8uOIbnvBCJu6DRqEu0pPYd79QoS74/NNm6@vger.kernel.org
X-Gm-Message-State: APuU4Z9FSZINOvTq268Zcm6hOus3KtSbxNiUuN4GNZ7m3P4Yb3sVC+mj
	Kqo+j8G/d95YUiBt9/5OzXOFZNkeZxUn1dFuzMFxcDKOyNqZepQaSalgyiSPwWdeqoIvumFGUPr
	HWesWmCagTf1IcQ2Nezs315yFw8Af4aSyRFEhHXM4/H/nqFrvMslrdOVf1EzN5XcR
X-Gm-Gg: AYBFou2iaZyvejeiokKdxll2LO9AdAW5FupOfreb7q3jx5eWu2ezquE7BYVOHeBLisQ
	haUDRDFqUsGBUicSd4uHh0HjJEXmHUdntdgw8IhfN2Gk6cBZKy/CAyeH1SOFoHkEtjXr4tkvT4O
	qMI8AAhR3VwnzHwQOMU32KsBMcUacKAzs7hqen2dAFs++xjAT1fg2Q6Iim0+v0R1Ts4/VQMKSG0
	BhugO6zMbCs3OD9yyEhOllnEkS71nPGgjXrLEJo3iFdltGcHqWgfYgGPJSxW81uubrF/szGo4bn
	5NsAY2RidjqPO5lB2lHD269XKiBUM0oUX9iNWw5iJrcvvGAxaT1LgBAeXIZBqg52r4Fa9CdyY+N
	XOjO2XE5wEouMcfuoeAzZusOk5qcFofyvHalFZmfCQMA54D9wFU05Terw9KbLIDtdynRxlrJlGQ
	ZlOA==
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024469d50.36.1794584844656;
        Fri, 13 Nov 2026 07:47:24 -0800 (PST)
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024446d50.36.1794584844098;
        Fri, 13 Nov 2026 07:47:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:08 +0100
Subject: [PATCH v2 08/10] of: property: implement the count_references()
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
Message-Id: <20261113-fwnode-for-each-prop-v2-8-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BHN0x24xd95rb2mhrKGRQETyCRuc9VJoqjjnbX570po=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD450ufs2CwVIpCs23mOJpPGkbNozDQSNWMs
 7IW9kDBc4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 w+jCD/wIHVO68ZHJpmCBcn8RSkyF/jzaZvq1EgP1/4uD5r7F47ZOwTPPMLcD1RwLlOJbHtQ0Vq2
 YFupfXTyrv4pK+6fyFBX5JfE8Ev9v6AV0ylQZOJbesz7/bJz5gSestg/uBJc5ONJAfowsfNWmku
 nFh4LKwV4kCuJbfHCtc/AIMC9Jog5Vg3GzI2srmBCp5YHcweYKcpeYt+IpKwaBldPyNBk8avMK6
 qe/hSVFsRA5ADywQFRBGIy4ghvGgq7Hz70jx0Zv3vc2j8VitCD88MMuuQbOI47szWMpMZRR6L3h
 r0JKZ9EvpgMxFQmiQWSvVjMdUg5Y0/dUGjwuYFIWMa4RylfYWD4uydrXaYlvsVBLB9sWrAniRWk
 PS7fu92BO8MRfXGHEEeVSAle7/0w7C2uGUbHJumm4PXYtRhlbawUGgwgHTxh6dA3VNvhUvWY8Hv
 EyKYOt5kX6C7sMuCA9a3VCSiDZYdVICvSLovK5LfPxW+l1ROTDoPOMwb+qBNQ2jcUj98SOAagRQ
 aL65XoBIlV+qrUi1B8uW4JLGFynn8FNrA2cCSiLP3eUeb+tcxb3vV6psgj6oTJB8qia14sf1AsR
 auibpNS867CZQSAuPWaX0Q7uymbX/MoOMumWYasi7033hymL9Vk87MJPQz6YsAG6AvZqWlKcQEi
 YP1Gau68T3bcFmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX5ZMvkK5XUTV0
 D6vVJnU80Xik5gOzqlXkC0A8pFX8dzp2mJ2wN87bBzpV2lLWZVu8WScZBz9bhXcUMJz6+6VnBQK
 +e36iV1l54DqeUDi8h1PDQSD3Y18tcI40MQmJMNGB1LUHzI4v+ojAcL3Oy0BSoLCp/XpKpsjtAz
 gJrmJliJprzWrA+xtib/BrguxxBaGPkDI2D8BiSWUoQtg4XK7VJNTiP4TLV8XWwhB4hKlZV2AKE
 8i/H1UR34um0kijN5m4xEHZwra9Un/NZ4aQ7Bntc90aiMk/aSAYZl+ksBjyw0TY/MO6PZoMmMwG
 GMViO7uiQ7cAg8nCguO4nVnapaTIgn44ZbTFAOhjkRWZUonLVTWe554hmUTadF7siTLwxFUCRj9
 tHfdBKJTU1DfQYAfYJL1OZGC87zt9n6ZoHdDFqnuvxT5YS2AshUWZUC36Wgf3eS7qd0d647TEFr
 CChR9QOiqbnVrIQOU2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX/2NFtViOtyCM
 dZxphND74BhrSTH1o6B78dx23d7n2TkjDTTnLRspdy+hep9HlqnMNJNRwumIpys9Ts7yjIZSDwU
 t3cwgeUxQWCV5nlDyjlvUWe9Tk37shc=
X-Proofpoint-ORIG-GUID: n0hozfhq2nVijWa3mP4BCT6fQH-mWn9r
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af7310d cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: n0hozfhq2nVijWa3mP4BCT6fQH-mWn9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53f2c84bcb96d3a00f3cd2371010628493d49bc4..c2f5c338b6d1e7f3515be76d21ba6ef097e65e04 100644
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
@@ -1749,6 +1755,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

