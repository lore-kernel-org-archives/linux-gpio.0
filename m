Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685796;
	b=vU/QZaieAjVhRDmuU6mR/oMmrJnk/Ewj8JyJ3Ddvb0uz/pXU7AdeWz/aDJR5C0W0f8vN
	 HMux1Pwa1wtQ/6EKxm+g5yOB6JCQ06SoDo3zXZlxrTFlXnmnsQup1/9U/CEcFLulQFkWS
	 IsncKe5cPcY6hBnS0agEpU3HKBbv3mUqKwNxP/ZvCeUIhhNWv7keIPLWIB6LGpLRtZWbe
	 THGR6wqS7kctuLkCGFbtpZ4RYnAlXha+63CnaYoMEHVHtyaQURyem+kXFX6rm15/jT3Im
	 eqd9tHa4hOPzNcRUd4XzggVxvQeny3BLwQ+t70wdn5lljbaT6KDbqZmojuRBDi8OcZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=4i81aeCdgsu+hXSSj9xy3gh5WkS9rU6I5ovXXuIBqvlrV2HyYTXUt3FedGPZiwRakquS
	 MkQYEUnoIgHti9+GN9X1JuwPHLWWYC1Obu/38expEQZDZNIuMoVLZudeTKHKbBpJqybjk
	 LU9GGhiexiQ82SKIQ5PmJMUieuBzePxUWVIxC87jGEOgIYbjCHj1E4x7kllTaFTvpmrs9
	 dpRNu+1TPxXQldGgmzYUzVX5BQd+F9lfs8ZAWeYrJwYI8T0elAfX2g7I2255FxdxKwUlB
	 iCVqAg6osFoKcU1gx2qrfC2BUv4f0zSYe2nQ1pGGTZbXJWXEB6aKrXEpmX+VHxBJw5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAp92qRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvJjSmvw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727F606A6BB
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6727F606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAp92qRC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvJjSmvw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BAbe3548510
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=IAp92qRC6qZl8kUw
	dH2qKoQmKk9Ad0X2uXjBsxvj7BW98KbGXr26eM8tcJEOIXugphWV7Ln/tOHEOaQR
	lqpjFh2NVdRV/l3dXbSmQl27jsfXDr+jY1hv9AZ4uSbQm1vSdZZnyP7druC36Fsb
	8MjHIrGBAlGaABrHzQOQryiOob3K93lZyzzDBFNYG/wIuFFtnqnH1him/5evqPm7
	o2A3K1wHTMUI+9zfIsU7CMN0IE4Q5Gu4cmx+W8axXAK3Xpjdv9WfC+ghiXt8EAge
	CfgAXyMdWNvSwFax3OWCU8mfYocl+yrnsgfS5lRBjn7uAwQdyXs+M3s1cmgJv4LQ
	8fB4ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauadu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495af07676so1037666685a.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685793; x=1796290593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=FvJjSmvwk5HbfmSrVSAwdxmF8sO5qsQ4rWfs+kExVGE1jWrJJWITkpnXwHklM4RS8s
         fhussS99wTgDTmnaZ/ckZAlHAiduDGO91SVGM9A8X7a/epqhUzU+Xo8TXvBqUEwbGP4T
         fdAeHdpaF3PDwrfXJGXydup0wsbJFIS2n6BiRpcPkTD65IX1KtxjKJanjSUtPJ1bxqRx
         HtcNvk/FcrGgPBs6x4elV3BhyRYrha7iqhJlHKgy2JeGELgT4hvdD/yas9eMlAmywF3T
         J5E5mb3iVlIqkFDvv1RxaltqDUZ08Ucoh1vhyFG35T11/VBWxVti8VrYYKC5Fe02XhMQ
         Sllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685793; x=1796290593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=lhjqtUjzPK6dsU3n7TnY3wG0hJTLUyfu/wAh+hWDCYhYNFxWt7aD1BY4qBAxlZi7cE
         S0KvRIDiqjX+6MXSiyu519F8rvJ2AzydAvJhfzaBB5tIbBkJQyVvCvAdeqFPaRyoMj/U
         XSHVx3cL/4k3bh5u82sSb21NGovjwEV9Ovjp7uMPbAtRcspVRznwvW68AwIhg+sBsFcH
         kvCExJeSi7JdssB0yRkXCXpfiGoD/jK77puplnkO5xe1ZuJ1fWuRkCQF/ziQ4O25cH6/
         2/IpwxSw94s3LQl1rrJ69tWVjx8Z36G8ePMHEzoyIbSkSHQFJCFo+4mILBcQNlGro415
         1e4g==
X-Forwarded-Encrypted: i=1; AL+hErEIYM1mnCMEvptxd/hkLF7KSUttimauf4ODruYayMYdMrzyN5AAB+duQsGNBsebZhvPrnMmdFkbN//F@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULpYgJsLGIwjcN2b+z/tv7IwLHrEwT7KW11mpKmB+/sXVQN+B
	VYNg/KNItI2kLgWnjUEwQZSMpn0VoZQqeQiLQjfKiNoPHLRrE3kUeCjw5fLn+wnc7l+YaZkyuLa
	3irJox85DPllHIHpYq2N3HFvtQ2bzpPxW3SooE+Ul5Ne+riB2NM1fvcjUyGuYzoeo
X-Gm-Gg: AZFdTZe5VPkKkEZ1yij/BO9bEzOPxSua34acjg0hWD5c5kP/v/tSYQZXEtcsYhKVSDB
	n16U18bntIVGXpfFuJPDzmTVHOQlMqlUSoCdgOWuMfO4l8IuSu7fBn/ESJmMWDxydqhu+V3GnG2
	4msYkjKhXeQanGFArH04k23yHoJRC0LoP7MMuLooeXaAuiG9bcgtmy606aJE+hE6wqWN6o9+o+g
	AYQmbftSrcvmxDTfsmderkD+CALXdmrvO6VH+NR4NyPLTSyVsvAT4srrMpD79dQnOqdn8ObgFMR
	zgi1dw770xq5KF1ZC0tRXnwrVcjpexT7azu6Hza2A2L1gO5VZSxCiYRdeGKxoDESc64UMTts2NA
	kqKF2kOkpPenI3HcurC2nC2oNo+7b8ApmeU5YRDygRnbIJdk1dTZGoP9oEFgdAyhJSYEW21JKWk
	Wc9w==
X-Received: by 2002:a05:620a:4386:b0:949:ba11:9612 with SMTP id af79cd13be357-949bab0cc38mr3252447785a.69.1795685793224;
        Thu, 26 Nov 2026 01:36:33 -0800 (PST)
X-Received: by 2002:a05:620a:4386:b0:949:ba11:9612 with SMTP id af79cd13be357-949bab0cc38mr3252445185a.69.1795685792680;
        Thu, 26 Nov 2026 01:36:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:21 +0100
Subject: [PATCH v4 04/10] device property: provide
 fwnode_property_get_names()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-4-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UFL2eWa1ZnlPyXIe+eu3NDH2BDtxgindkM
 qle2Zcf7BGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8ruEACK/zZo1BDYPo1sgvFBUDw5zsXDSNiM7OCb+9Vg9ICw5+sNdKHjQUYKn/VjG8DU8N8iYzw
 vsVuP0rttxGsPtjK68aEchLxrTrHU4EPawQoU4UZXvxHgNRQCRbHBeKimuyTq++AdjVwMSfX3dZ
 RguXIHFAOZtVo3HMTh1YXrcABHFzIg7ZY/OJyeI0knTMUxuNEeCgWYpBwfPVTplcQoJLWahh0fo
 7sGucCydGHn7bq6It6uLVEbvJvVZKRINvao/KdooCUPFW6MrCg5dH3nfjVwM23h4pdcB3LkSeqf
 kAjrIGQ8q/Fe8jZZk/R2D/T8cOQ+CS/ZbEN9EGiCrYR6FN2myVFeM3Nvz36qH6gbGDSwIsLWFXK
 ufWZxvT6pc+CwU+ZBEg30Ix5euq+Q1lYf2iMLiZwMJo2TQ0Ff+t9Nx+K39DM/cwKRw6Is6MhDiC
 dqd44UK1vTceSfivfDmmJi8Vw2E4NbSiHTNn2uRWThcfN3In50A9ODo7ac5odnntiEGt1CbYM4U
 CxNlDnkgUHhFFZC2yYoztJ+q2uGf4dbNiAU9NCstbSOgafCtvEq4krlif9J1n7iUjq7RmnNjXem
 lcIZX9LokgGTjQ8QzNpwWaTWIQSg64LRxSu59pZfP3MnG0D0QIaMBJ801V1j9VefT68eJqi/VcB
 jY8cFOAF4y851tg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX5+JNbdvb68hP
 LT8AUapC3AIltWWsD004c4Gj+nmffcb22Rd4lPmKqpuhnU4hVygEP7ZJv5EOJIMTmATbntc9OuA
 a+PQdvw2bEElnFHi1xdkZwS/0KQQYGM=
X-Proofpoint-ORIG-GUID: UZrlLhrar5EX81cxCG8jEihKoo_tbkl8
X-Proofpoint-GUID: UZrlLhrar5EX81cxCG8jEihKoo_tbkl8
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fda2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX/QpL0aLbFCLS
 PPVhbx4uQb16uAdxJS9NEkeJCBIFL5ReVNEK2ZJtMfj7M2ZiH8VRy3r/w9Fyykn23tOFnf4AGeP
 bk/V31KhwOEd8uN4aS4Pcx7yEL2GsNitNHhiJGqYh78d5KDKdVmJw2SLWtf0UQD15/SSsnPneF0
 qfehFcLsE8p2NxkiW8wpwURErpRB8oI9JN2lgDyA2g4nvFVbKXHDo2QKM+nHDICw7mQ8Ab76QP6
 B6xUozoWR8UuRKmC6GxBC9RRqttEkzHKgCzu4nvTWNcs3oa6ouY25WBVne33ag88AyPA22dUHHb
 nt0hsx1jnkePlM/M4TFD6Q0m0UUuqvNG2W4O+dTgqv12teSJcIdkHtv0ogz18g7ODqsRw13TX04
 vSiSkBpCuKmjyHiLmaLDEvz8eIITwMdeBWKbuwKuSJ/8zYp4XfEaELOqGxwnrWiuS2+6Q0xeJSA
 8ELnz0eWjKmKtvGsw8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 80 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7728116e296872b7ea4d4475aee72d95edf63eb6..d3c54c3d11c42ba4aef68687fc27291c7f33beb6 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,82 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names. Must not be NULL.
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once with the ones from the
+ * primary node taking precedence.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). If the node contains no
+ *	   properties or an error occurred, *props is left untouched.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode) || !props)
+		return -EINVAL;
+
+	ret1 = fwnode_call_int_op(fwnode, property_get_names, &prim);
+	if (!IS_ERR_OR_NULL(fwnode->secondary))
+		ret2 = fwnode_call_int_op(fwnode->secondary, property_get_names, &sec);
+
+	if (ret1 == -ENXIO && ret2 == -ENXIO)
+		return -ENXIO;
+
+	n1 = max(ret1, 0);
+	n2 = max(ret2, 0);
+
+	CLASS(strarray, prim_props)(prim, n1);
+	CLASS(strarray, sec_props)(sec, n2);
+
+	if (ret1 < 0 && ret1 != -ENXIO)
+		return ret1;
+
+	if (ret2 < 0 && ret2 != -ENXIO)
+		return ret2;
+
+	if (n1 == 0 && n2 == 0)
+		return 0;
+
+	merged = kcalloc(size_add(n1, n2), sizeof(*merged), GFP_KERNEL);
+	if (!merged)
+		return -ENOMEM;
+
+	/* The strings are now owned by merged, only free the container. */
+	for (i = 0; i < n1; i++) {
+		merged[i] = prim_props.array[i];
+		prim_props.array[i] = NULL;
+	}
+	count = n1;
+
+	/* Properties from the primary node take precedence. */
+	for (i = 0; i < n2; i++) {
+		for (j = 0; j < n1; j++) {
+			if (!strcmp(merged[j], sec_props.array[i]))
+				break;
+		}
+
+		if (j >= n1) {
+			merged[count++] = sec_props.array[i];
+			sec_props.array[i] = NULL;
+		}
+	}
+
+	*props = merged;
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_get_names);
+
 /**
  * fwnode_property_match_property_string - find a property string value in an array and return index
  * @fwnode: Firmware node to get the property of
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..a70f3c4c087dd85390951da950c3632f89c6cfd1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -77,6 +77,7 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 

-- 
2.47.3

