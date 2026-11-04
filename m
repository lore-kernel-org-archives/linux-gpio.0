Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801072;
	b=rPBNNm+eD0psnZ3B+23jfQ/dwattZPe1mA9J/G+n0YHAQJ0MxWU1Vyv4CKFGp3NLKP51
	 +bXnnKpZ6W3FqC+qCzDZD1w39xAvdao0iDKXae4sK5icrHXTus5Jy1GTBFYzXPaL6eVgj
	 +4Qy2Sh1DNdepSY5AYNlBI7UMvcfLwGl5quvDEWNx4z0WCbowioGzvoKZszXS18zmKrt6
	 Zu1ivVsqMUp/4kfQVYIm3jEVqim8hrtK9UD0XKbTkZxb+U8iVscKwr5K6E6grpYDH35Y8
	 Wtuzo/81PjvUfoFcccvZIxXVQf939WgRcjCaUPzoib9av4epVdVnwl7Ocp3J0KVB01Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
	b=nIzzrb8iPjoVL8nyIwVmuFqCY2KvsuegPwQE/2gANlYMp3BtxSqg22RCbd+E+N5BTaXn
	 /tuFCJ63SE69VMUKIYOzvqISagAbqwS7GYLNbc/U7PmekIFtseuos6U+6S0MaiDBJsVKO
	 WkxeqBjfAZ1VzY0uQxjd58JAWTQzKq/CSQFr5yoJp7LDONBdzENAgN9bLkD74hKpz4o43
	 zqAMrjtwJdCK6LgUyORue5Tc8vJ9oVRB5VrNQd6wla14NiOwDw5lUkagmzAIYiEgtNABa
	 embRsyTlnTlTrItBVot0IqbHb+yrAmFvw+Qr0USr5Pv8kvURbauw+WZ9kmcmMcPMGug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOgz3yJ1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC5606A32F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEC5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOgz3yJ1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1KM1149918
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 14:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=; b=W8TE8KXWhAa7mSse
	KqJyND/Uo3fINN8csA0WHZcbmFl7o58YkQE6yUYKCSKHoncFZiEhoUB9yB/IcGpY
	lv5bJhF9J6qBLZIjG8jyykN936enW2UF1OG9Uj/4xGwFwk9jUQRRtOjGGqWzsmpa
	RTf9H3EWCGZa4z70OSauZu9/CtxDdBs/ZCrm6SH0ojWgMurFD9Y1jLXJnR3rqlwz
	yj+YdduA/Cu6kaCsFKOTCKzuYtUr1TmmfvVVGEV5NJz/s43L1P/VdA63capDaYVE
	WxfbYInzK5O6PFMX3QQ5vxuGTY3886ta/cwtsQh0Man9dDcVV36m2GvXwM41XBOP
	zCge3A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y434t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:04:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so616988241.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801070; x=1794405870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=BOgz3yJ1/5c3CstAfICtLSmp56m/9Gj2CoA0C1mYy1dD2rZuz7ppTds2js9js4WMjo
         +sYVTr/DlznNMrFr0BzaGj8ROx2m4+6hY3XME6EAs+2ZmJThK5ZQmplcSAsniNaHBCiW
         HYrVXTgwjh30nvoEquncraiZD1dlpk9J2uZgFqDo0yhthpRagM+RDH1ffmzgZkkPtOSt
         2bASLpbt5z3pj/3wY/fXO1PhuwYcGE3brAp4WAq9J10rVcyptHvL/3bOhZycP8aVXjLn
         m7eLCsNpQvSJq2SwmrUHxbhqZwfplNcTSrMPHvEVzhDX45qom3XhimglnlxZoSJzNw+2
         Pi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801070; x=1794405870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=vEbQiP8uxJACYZBjAwPRfXKHd2Py5zm+dr8VR7x1fLLjhVmB+RDloNwrk4JnNieBES
         PS9MLzTOLL3GPpnovTHv97B3DJiiqW1bUcHcVRmLq2+/YQVLnLQEFTky66eWpvPY5r+o
         faO0A3mfK2bTQwQRGvHB8sk93fr0vu2jA8PAyJ4KPO++Qx7/C+tq8ca24tLXQajpQ6L8
         BsT7nLXrPxGbuzmJ0VUmQMOuPgi9KCTNIlduOeEVcNHs5QlBI9potMpYajT0qc58V65Y
         YFwGXp+kIv2pIQRMLvuDBkyVth3m2F8tWrRs2Z7yRIp2eH/fQgLqq1n1hx+p4VoJ/PYL
         SNLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIxYZrifQ0V/vNxhHcXuAnvUl/+D3QvifgC/Ghu5IP69NQzrdHDfW3vSeQibLgE9XEymLbgAgVAeOE@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Ovhr+e3E8Ir37RZYYvvyWhund+mRmzKClatdstjPd8Lay1Ca
	qIFIkJRyVnOdmM7wEwU5Wwcznc8TJlv22/5Utz+TBM1iu0vZi3cswntEgb8P6ymWWy35sGUgWMp
	D2ph1/u0udDUxg2R5rRHS0vCzsYX6SHrL5/rh1CqswVz3SM2iYxRMQWVFFPoZS8J8
X-Gm-Gg: AYBFou2G2e7hugOqt6UXTxNX86d9w6MdwlLOUnczB+6G2UTseeIfbCnkOhk27fajECY
	/7EcZBF8BPFC4fyfkX6/7uSEwKIwrCeX7lIRsIKD/9xWYMrnW/ep7gAi2oeoTR3sm490p170Wm3
	vfeRryD2f7iCwfQLf+/kBxRuZ8fKohWpo83OlBTmSXA9TsV+A7PkT6hRwaG4LRLI5dLBsmbEKj1
	6ajro1ftCUFhL6HNxk6nsUl263n0Zit9f1DMWT9mjEmBvs3LIA5qyI36xsbjiPXg3+vSjZb4fBQ
	RJP74gqvU64MSI27ftw98ZsYjJzsEo7LnaiJMFxBpgW058AKTkrMc1AXWV6qP9y0ycpdVVpxEhL
	zp7UMeE4bhScUY3YmBafqca65+i5ShZs8MhqcNxN5RhA3vSzWORjr5bYtC5SJ49jM4mWxvy/QXe
	qeTw==
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944320e0c.13.1793801070089;
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944269e0c.13.1793801069615;
        Wed, 04 Nov 2026 06:04:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:47 +0100
Subject: [PATCH 5/9] of: property: implement the .property_get_names()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUearllheTUa0mAxFBQA4rgfpmwyh1HyyvDmdireIIM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSMudMNgYFqcJmZ0DLcgsCP+qirtdi2op3S
 //eoHjcXWuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w5yqD/952xG+8H9EKe/LRTYijZFEaI7dbjICEKB8Nx0sjEwcYjqdBdkX0oHDq9Q/140tjPQSf+u
 qUdmFsX0hn6S820xkPwyyBg4+AE0oQYD+GabGX23mtxW1HzzaXaX0EE/EIO7Rgq9eQxtDqbPLK9
 kbqiniYPqMBbaBmtmjWgVwuJ0foj+FXKTtw95VwYd95a1/fV+cGb3OXffG3FflbxIXHVxZ0p9IH
 VA0B9agIHy8sRzm+pJKufG2sd5PGB8NLotn+zNMLTJbiRvJxXO/TPluKWty89//xYOQt8gr5jvW
 0OOIVr+vnBwi96VTpN0KBoxhE2acadMuU5PVAmFNNpUdiialK77WyltSv20jRrG3mzarDMctQL4
 /rI3XmjAyOWxrgQmoLx8REtpu/BbdheaZTlXUee00w49zypxx6QxsnzhRvYoUSBYAaDy2Fc1esh
 OSuUqmpLnhRVF1RfozKZOKpUgfq3hoi6R144EPidufa1CVMmfvk4s28C8diZQb706YSNBPlJCsj
 x/Zi0ljFw0fH+hlrBrb2K4PBvX7HduzJCxpPIbR8V4SzAaS5Vp5jrhJhlDGzDbALi5G7uE4CRt5
 QF3KnUhWpvDRhzBn+K6fbv8UXdtVrrFfiVnhJE1I79zRBKUWOhJ53fubnCpzH+/9Kit1B4lUnbx
 gRgmnYNRA18XMmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fTdhlZCZbk_xwxI6Yr1TJqf6LUI0Px8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2Uj/nyKcc1Bi
 IUVzyPXb79JGsQaKws0Ih/EST3J15Q+rxR+/HU/7tiH2kbNWVFkF2C5QW2mIy5TGLYNXfRCymxO
 uC2plhLP2orJCKS/975CZeSJ9IO3eMSbZGycERhzKHCJ6mdip3iOInjAi2L/3wFDOEfO3uIZZRl
 /8l7eVDE0TqhS6/tPruKw4g5njpjRMTA1VzZvPPsUg/usN2ZBg4/xjMTyookZWchMSAL+K7Sl1o
 GJtWAZkymgsFqOAuB8HVu2qTmnsXPV/ViNGG+IpXCqgYRigjCY62awmlxiDH1cbA3uFIqDDurLT
 NSgrcLIzfjl3cJDXwJ8RmzKXVHnkj0RFSD2+w1PaIMrdBiXMnKNula9eoXnFNeMowoDa790ca47
 RuuoSJ6+lgQlQ+BrOjVwiZiXFwKa2M/IyveDKaHP0AuTUi9eYol0pBKameXCqK10BEsB0N/Gw0J
 mTCfga5vJ4GptsHt/WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7j9BNcZhJz+B
 B3oNTQ5YJU7Mtos87+1IvxvN+uQ4GoBS81yjfKEYmI1l9J1wWj+9oMkCMTjQpsJ2428+iRj1tH6
 V+EOTdYD+Xciz4J/TXLNyvBv2ck8AbA=
X-Proofpoint-ORIG-GUID: fTdhlZCZbk_xwxI6Yr1TJqf6LUI0Px8Z
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb3b6f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QAC4ccWuAPOjo8k0q0QA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..16c9c307633bdc7c9343782b1cd3bdb845552c6a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -28,6 +28,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1121,34 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
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
@@ -1712,6 +1741,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

