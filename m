Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584836;
	b=2YJ9vAEjodRmR2qnAB29nA1vftZUg28gJwv6Di0ANcRzhGnTNBwQNDwizxd7ED3ss3vC
	 YZGoVBEfoo2aail9BUmmGBiRbOBipy4LWffVGy9M9URE7ocELkx5EjE8twF2nMQtL0UF1
	 jge4Ym7Hnd/QqbKDEGWJIKMkFf7qc1jCV1LzwQPeemLw2vxub1K7sU3r6HeGOyB7yfaJe
	 D+dZyTN0mWe2tJZdqgf2wk/C4iQDgd6TrTb8J7ec0/l0gvfSr7RgVvVotu0EkaGzApvSv
	 aVZ8HKxwD/oR8pWFOMM1r3B5eZxuiHnruFRZky/Y73Qh7Xag6+oRct98rNywNzOx7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
	b=LY/djSsvowGlIgyyt5WVlD9WxgGFJeRr/C0zuy1uIb1UYUIaAX/pIZdKUibxEw/XhZjd
	 CL8U20lqThYMWNlbnqVwRIaziXcINppHCYXn3B3ZqQmesoWIFk+qdDUTKlglLb5SbE+H7
	 6rqDKd1Dn/tvXP2iKzx/rkVH8hAomwu3c3wCEFvxtbY8WRY0rL7uN+wAGECCf6/KhCixv
	 fMIITr4NkFczgqkVXrteR2dz8aIT/NSOGann6IvAWml7QPWo7peFa2moGUgiyDvb34rWB
	 ckfXibhBXwS+arsJxA/GPvys2RTbK/WEqK75zqDqwt3aadWCMvy2o4wfjCO78FaDsAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IStitQ2T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75A606A8B7
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE75A606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IStitQ2T
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRciU2638622
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=; b=n4egnpxzMUjory/A
	EgpxLjmcnRjo/g0HqrZ3k1+S5ZhHMOrlwl1c6HX4lCY/+KurbdpSkhK0VSO7c82O
	le9ef+plrlRoqB8I719JVmeRxofV1IOQSyTsDzV2YBcwuYkwdpYfMMr4mDCjAj7M
	lvRG/lHlfk6udEk0GcftmLxA7lkn0T4nMDk0tkU4LsuNFC5nOk4+Ml60bpjAKyFL
	ZJGeQieIm4ne4VwBjti0xnBkT7HgO++agHVH1l8x0v4y/6cVpH54nME+W/hJV7/K
	MLc+EcMoN0Kz4umnQV2cokbUc2TUCyEOdSX1J8eUU25ZY1jsIhnPQWqO/pyGX7+X
	R+XxAw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2e2cd9c85so1007512137.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584831; x=1795189631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=IStitQ2TlnbGRbMsuaUy0bSmAbsl3uGIZMXp9N8mU3PcUWmHAUZHQ+SCapFjWmzAB7
         NO3MZLctan6xAyxOT5+R+EmSDDMqcH17rNDYXsJm+/abgBvzWUD5cHWjDnhJa4eeF6as
         PxuxehHp0pC4zMPifbyfg7zPmLGsU/hC+ZzLkMybhZcrRJCvsHU6PEHg52esZHJc0eu3
         fob9pzMwd06uJUmaWJzQ4+Pma2w+oRIM7f0nX5cjPIYgzNjRDGrWjhAc+Ac+GHdKNEqv
         uETW/Su5gZYjO2nNOchJrAYDDr0cjkiVq+AANP3wkxVFL/ULHxS61HVz6jECbvnn7aPR
         AnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584831; x=1795189631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=qB/MqaY6uEmik2kqRXgWzIdX97B7CRQ6+zR2g+RLB/stsp+lfjf4Y4hDzQ6c98bS5Z
         3rM4hA0UaHfYhnYfOjhOQs7PDfqEukEZIgmCvkSgfQYLz89yzTmZ+yldPyMAXQv1InPy
         LAUtDAjY2QNBLpfeHYiOvjhDcPsTRzdWl7CSGCQa8TH/6egtMzIVC8jPFndVU3hQGrY4
         WP9YItVH3e1TXkfE/W8mn6vpMoXzw6vaYDdE88WooBVjxC1dXXAkKq8CZJ9VeSRZL2K9
         u/g/rS6TR1FACVtYZYntLn9p2hpsvmkavfvE0F22HE+P6x4QHXxbNrml/N9epPDOYgXI
         hDqQ==
X-Forwarded-Encrypted: i=1; AL+hErGLkSKJGcm3ovDhWORb0y/J4pP/VNnK2IEJgu/0LvuzH+KvhsPsZ0nH/RS0gGrfSwufqNG2posY/u23@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPMnwjwUjiJLSbEvpGYbleTLGzNGsIa1AkSeYqFpszdep3/Of
	Si3GK8oDeRvNPIEmCBTqB8R2EiAHkSPql3a6bkAmFt3n3ZzXW/6ae/pAVLW41wwCQYLhMZL1ZeC
	FfF/6gZqdZPxTxUCTx1HlymjDO6EmUPdD/0a+lWnXWXkcPtsl88VgXUOeAeH/G/jG
X-Gm-Gg: AYBFou205PiuWGw7nBtEltz0JT9RRQ0Uv5gW29eCxTE7C+D8hh34QPZJbUDJRKVW/ir
	+sFVaMWExuRyLiGpKs/nZ/F0gUqvX/QwtIRZzALtLnzj8A6raqenFT2fDeB0YqZTleIIKVDyKwp
	SLk62UIP8kI2ko/1fp4tg3mXNmueFvtu1K9Qjw5roypLf0Uc2ISO+tWZKdjTw0/vwaeQdXmfE1E
	ZzhRgXdXbfhq3jSPMW6u2nWWxID8QTPmzoml+Z7lYarrqAfCJ6yQoW7uhQl3m9y1+V7ficvXOMO
	DUNhjCiw8bVJhnYg5BMf4kNLkKUYem75eKQ9vv7oG3tlc2cJU/MgWPgRfZJfsj+OtRnbN+Jdpmi
	0pwQEsQ0/6oe03btxr7oLWWMiOx4AdkYngqLk/O9bk0xsWxa9cWt99gxOMoRctPNnOW0a/s6Keu
	1K1g==
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050077137.29.1794584831375;
        Fri, 13 Nov 2026 07:47:11 -0800 (PST)
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050056137.29.1794584830870;
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:02 +0100
Subject: [PATCH v2 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
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
Message-Id: <20261113-fwnode-for-each-prop-v2-2-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t30FPQpb4Tnh5cjxh+syE/bSfLdlIjxN8NWgVucIhbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3zxDfNmTZ1oYpGu3oDNSKeYhLlJcTGJy3w
 i9b5ljY2i6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 wzyeD/9liUwDxOgRuCtILa7ZmLSZouUUEBMZOFZYeJfLbxqPj5BOO3LrGyZBB4eot1x51iaTeaL
 seAk8C1sdvB1kdjX6QVoJ0tGLj3Ws44IQ2wvoebYW9lUY6deKsomvMU6U17LDKO3L/XaMt3FDjV
 e6/HReOyU8IGPJLMZdufybX2gEVS+Xi/MPiHXevqmFcPKSwOoRFNfchRO8E4tIOUoEJb4mIRsQB
 0rsnTeD1IDzbiN+9o8sigSIZVxc7md3ox8EmjUHcINHaClSoizGKJ5TEKAEW42pw0xIgalLcI/B
 Ta9vfewgPI6i03x3Bf99tJUk+JJ/arujVKmdsdTxAe1iIPmdsl8VIfL2upL5GNduYQ5LxyQRP0R
 wLCEUqksltK4bnonaZfrLbsYBG/jMOWQVFyDN5lARrMSAUS8set0dHoSVQRsG0HnuQymrmjVteg
 zDr9BzfXp7bdlYHJRThjawEDJTtrr3tqtNaBw9IHETOLc55+W5EbKbDdkCm9uib+NWXiiKN04kZ
 11miOyx0tXie3POOHvpLjdqe3gvgfBX6bMxZM7yAGpfgwWV66EHdGZMIXgHyKMg+vVC4m9mKL8k
 RoYXaq/lvXSIRKxVnv8lbV8T4AeSEaWmxBot0jOg9YtsPA/2tV6pyP2JS/lri4VVTt05v3Cpxld
 d+rv30AlQOrl1xg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX12BTXXODlC5g
 tiQ8N6v4qiirZQzOnMcPD17yOHP2WO27SY5n32ofyY/AP8JkySbpbCLJwcPql2nm/p5OUG1C9+J
 D/w4OkfimdHL5ctOHJnDbD5Rr/VBzOccTn4h6BU7S0ZQvdnZzTmqFzOMFKbJJc0/XUQRPRI66+1
 ecd7Qj+2tpBXAJUOIxIYU9McQq3dpeYg3miPmOkQvNUqjw/KqDzawwHdSTterwGI/7mHS0qZ5r6
 7O+TEhc2U3z7EXlHo6mSrSCiB163jNcMfAcOhwhPgsxsArfPx+g7w3cwJfEhkJYsKtg6p2UYh7d
 raZLrehdspINM0fRcgkv5I3h500tfDn7gDOdEjY0Kj2l8yzzY5pLswEG18fR15n6ndFMf5U2SiR
 ja2zqN9uFG2G8OzxDtDaZp7gSzYSOWOT+ZyzdyEFJQpSZg5UHlJnlVlT7e6C5cx7dTzm9jl1i24
 5j0QrVIHDGUVrHnVUvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8cm1r8PF4H0T
 QNKAeRdsNXSu8S5tz/bqFdlnW9DZpW/KBeUvYxIpuJ21fKTf95jKuRmFql3QbAM/2i9tgEhsB7b
 jrVivhG6abts6IoZ0x5OCCTZlQHaux0=
X-Proofpoint-ORIG-GUID: 35bK7C3sIJnjcX52SDC_t08J3go6d1zr
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 35bK7C3sIJnjcX52SDC_t08J3go6d1zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

