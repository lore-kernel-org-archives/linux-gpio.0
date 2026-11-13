Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584835;
	b=dPF6lSSqjdxzPpVG6P5ScmXu5J8+TX+JmQAsZvgVaTsvaHxNYARkGsqdlFAZyA8NSePL
	 uBTGKoVHPz91b4YKZQ/shnk3bLHmpzDohV4rFmgQ0EvAtZm0HAUgqhNV2kaepMCUiWTk7
	 1gEuhavUCICEb0GkoDuNZXXptXCVTwbAEjWWtF2Z6+QVBvaOLsvKBdhL399TqYfuj0nUn
	 G3HeaUIac02j3xwRCRJaBecpFSEkl7XAuP5oWuluVwhsTJLO716UvIQSI99lqR4+Po5vS
	 +X9IlijwRAaOBoMzwLqT7W0sgU6Ky26cML1A37+wsYLiZgTQxXpGhGPNQUbIhLKGVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=4gtVsOw7rra7BGGneDYI699CrdoeieXSVltTNo1lSxesk8m9Ny4eHoZ7Ih0xpdpGUGTO
	 koNpy06jcmRxk8hbgvNrJYDvS/2EtKhJ5ATHgMx04N7D/4WnT39FwGuMOZf/+DL0VGi1O
	 MEWbj3LBJeYq6n+3heyfUPpIec3RQzayDIVnz4hYgmEtUIiMzDh4LP7Lb+JM0ipYSAhmL
	 5Ai4/YjtMxEp8luW6JXsUmfWxmxnadbojPDQkzz8xvRqbPTJVmAFJMxBnVkLNHPUVchkW
	 94yLNZAg66AgnrohcHI+md9usFpLfKheAjo7Y/eR+UjzTgx37LVvYPa2EedoEBMrpmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H25Q8O25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC4606A8A8
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EC4606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H25Q8O25
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRSSA3296067
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ayi6Eg+O63IiTBLO
	aqwR1MzJcaQbQY+c3boQA+MX5zk2g6EET6JG3rVQX8Woz0bMlHrl5OM9GU6w71aa
	+/dZsWCbKNphMNNbckUtmF7riqhc2Y+jOnlFRS+OzZktvQRCKbh3ADhAuypPOKaC
	BVxLJUscjeaSjGGSNgZj9ts7Lx/8oA9Hks3saOq/BdDFn0b8IQ1mIzL71o4H8Aha
	k0aE5YOmIO2oJP/y+d0IQe19Twc4Vs0z4EMgX00Z4yvFTYQ3lOvCreIDzt/OM4gw
	xVGS4wMHGm0SGrMJMAXdZJjwJ+uInlv42CT/5THt2xc8OWUVFTKbrnRf1K55YaiB
	D33sGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6t0mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so201266085a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584834; x=1795189634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=H25Q8O258Gtu9tPQnl785AIBqPlebbC+4+2PjuOZ4AcRn1TN2x2mD23GADMsB0yrwR
         KBTDy/foJsKvjp2YgQADeGQghCENyGqtjzATRhgQtA/6Zu/NtEMkNchEqse1MUrfZF4g
         XcoBlYQjHFYiLYCRU05jmR4PUtsVuv4O/gULM54kQNcAPbxObeWMlbXszhRMj7fHOoli
         3Nh/1d0SG4R9yI33cJKlN6nezmrur4+enxKYkZ3mBaXTx1e1gAjdkcS4vAzhs9vhDKMu
         XbQu+Aov5V0LpWltdzFjFPu8kibqaqnIv4/+czdf+K4BwHaXP0K++L9dBkr3yiefXys/
         urXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584834; x=1795189634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=XbGy74SRmdi5gdQX8ifNLAkHESRZ5gURMBu1MGIuCAtzeklIXhYdZxd1mpuRjzxBsc
         jGmNDfcIfIj4IMo6lyjUKsyz4Zm76fuK5KY6JRz9huP9SMFZ2BRVeczUpSkjdJuLv3pD
         erQ3gmWSYXNT1Is2QPs2p4BPKZ4saEwJ4fgD9RVJgnH1EB6YyH4FzVAeN2Oe1xiL1Bu6
         jzln8gL0cP1tiCMMeoE0+E1h255eLPqPXz8aR9G1pArkKFoAK0nOYQw/SMSd/aWSZBJ8
         GzvzdThewsWU9MAEOYM0/JSVLj+CBs6w412611odnZTa79WmeNIEzGwA57gg+HxbTvqP
         kLsA==
X-Forwarded-Encrypted: i=1; AL+hErGiLe09OKO0wUOc0oXw1PW25ZTaWjGGnCcQ337KYEjMnn/pIztwZEFYSdetUQyFSheI3uT83BXqCPh+@vger.kernel.org
X-Gm-Message-State: APuU4Z+V7Z0NF5PGzHjCJlcvI3uycfx9Z5E6Frc7o9UVWQdizCyBsMG9
	AnES/jIl7gSE3uzGvsJDEpLqMFG+mL3L/bSZamIHUkGOtWgt9X0/mfz4ZQBWe9EMb9J90Ydy1WQ
	bQGi5gpi5Dg7o7eCq+y8gzYwB99fylP/WXUEN3UNcPjgb0wlM8F760yqvRPccUCy3
X-Gm-Gg: AYBFou3CWP2Lmlrb2ythZpyQBQkX0zDDNvXOHs6pVl+lGZuD3L7ZvwxMUiigY0YmXSr
	4hBSOUJQ7XuuCGfRT5n8CKoO6F2dsA8PGqqPI2pTmo0V9YvHHX+8ZqzTT7+HhyJccPdEexHclDP
	ZA1Gf7VD0XeatFqY+9QJJ9eHaQBDQNTo1frDP/iHVcf5esV7bXxDzimyX/XR44JRGbfjbzu9ll0
	Tu4XRzN0hssgjbtHDwME8jsvzo9nmZM20tBvPSTsM6Fgyf14Kzx/UpoBxqy4B5Rkj+39KAkdswV
	Ca0Jg99hi11POuh0yzB587lno0HbsSM4dL+rhonOBMKMVSq4SWmBlnv6EE9xMlK96BWSYBsOClz
	3gZUQK+ZLqsUQEUbMO+oKxd2AlrNH2ygq9/alR3fGknZS0MTWCWvvOTBgtqNj6e9HL97uUk13Fv
	kuqQ==
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983715985a.0.1794584833661;
        Fri, 13 Nov 2026 07:47:13 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983709185a.0.1794584832967;
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:03 +0100
Subject: [PATCH v2 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-3-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3CCYRkoz3LSF5VgDezGuy7MTYSM/0TdLmX
 qVEWgNL346JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w1UjD/0V570v+6T5CVF4PFoZpn9KSq17LrtfokidpFBT7RDjt0GRYJmyKILIOlVrVDojHSNz5IE
 ALF8BoTy6aoU6ezLy4spqH3OC2kZzdtzaAg2dkBDAsHLjeXT5/QA+l6C9Jtre2CDtyAV/2TZfu3
 vVClJn4JVhPMDmaHAFWQsvSEODTOv6nFe8kuJ+xlmjRkoJcmKxzO58MIdNod6070QXKsdAOj4Pp
 J1WlcbOE7ohJPbiImQO4upzTUygicE1gmchdSj4okHIh5n53012m5vpVLKBCRweFnbUpLzhu9Pe
 jQF9QzJw8Z0s9DMHUZg6D6jxI/i79YzJJ6KPK0LgGs43jQAFIg+e/GaN6z5hWcSVco+n0f/sWYg
 2r22Fsz9+qknrFCJ0ioxrQicw78BXXeOLMQsNOATM9G3cHzy4Nxoe//20p+12c+vEyLva04Z1wU
 l1n5RtZVdhGgO+6zL/L7aE5IO8ZG7mIV1aXSJ+JkbWyn6K9szQrV49Z3K2TNAfCLEQEWt4xlFou
 L5kKlZY8oi7mWvpB0XVeXi7qo18prewpNF8k8AyEit5hNe8OZkyWLdENpHK+kiJZ8WYoBWyaAh0
 ikNTb9r9ZSTfZLatbOnya7dMYksWgzSjJ/3zgN/YiAF19+LkWm9T5CqXHtHmOeWZ3fWSZOyd0Bc
 UU0maWv1yZ+Xrfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8kANfm3GNbNG
 MOiNt0LAy9s2lW5NzUIiEAEfP1MaYaMvBFxXoG/3OZMWsM7e9RCLp3ElhqOjnE9VNf9xbgtcqy9
 uuBCBH386cbI1zbRAKC1H/Ue9dBmRc/WXWi0LrQcIWz8hdkKGkrBSXVfO0V1kpTT9CfHqLS0kH4
 wWA8z5ZjCB8HcrVhYhePnflj+AeDhc92klAx/GhnADH5vePpQokqckpQYdIiattfkx55GtN9rFA
 ebzR6nt5w8jksYtaLSuI49Ik8qyYgI+ak2R770LXYv7JmAljtaHzcYH0bc+1Jny6fqjefFbUDLx
 YrnM92vbyinLympZS9PcJI8X4djK+3PVcdrk+I25kBS9Xr+Z4I72NNlrH6/WIGbX8/+cCF29KGy
 y+a8hvXXIYy7F+BL2P+8nHVotcxS/qhro0i73FwEhvpzPMHj0eV85Amq22PQ6Dbs+bhuc0UlI4C
 Orn3fL/XFZwwvIoa+lA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8k0oKFKQcNpm
 9Pvz0hdrH3YD95vwtcPybJCzBuRRIuj03/th+zy8QR3R4VXRxZXbveL9lsVy5u0Q3838tyE+jpN
 3GJm3mTKAG4kD3qMt/275acoQgUQYiM=
X-Proofpoint-GUID: otwFb2diSFqT2wWjbugTbuq9RCEMBq98
X-Proofpoint-ORIG-GUID: otwFb2diSFqT2wWjbugTbuq9RCEMBq98
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

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

