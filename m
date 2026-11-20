Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178818;
	b=hg6oYDcBcqExIvvEOiPXJRgglaLCc13uraX9C6kwqAx1sYfwCgNujc7fH8COQWqrBvit
	 ZvZ1OC2f9ysHb0156e7wjxrAwuusJ/1TZQj2QqIpCpe5AG3fx1+jgKgUmKcu7TzNzasz/
	 N9dq6jyQPnO6lnmxRSZaX+nB68dJIFJ42Nue6cIkNuc6SN5Ii4Np63zzQtFE62iYkkwmQ
	 MpfPvIpN4laVUIWKJbpme0IfWweWnlkJUf4P58iB2xfwIpR7NGWf6E++jzFezpoMX3npb
	 eKd53z3t9TF2J80yv+9gPofU18coJ54V99WOZmWX04M4W1ylexqeB9E1hd+xU1vMxJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=1m2fhSfdqiSisEQ3fMVB/3ZMli3MUlj1kaZoX2Rd+HBvi4bcvzGy7TWatcRy4dPXeiXg
	 Zg7cQFg2aaCAnAYHjrpY3uliUQpWDqhHTf4qBGcrbtO9eFXEBcAPGUrXcRW6uVgP9IXg7
	 5e35D3twZzVEOhWaKAfTEblWBZ9FfntJsMqUtkxQaXRSO8D5UoU9iZP0HwDMi8/XpdGrK
	 8nViTFJ7AxzFJJQNhPktq5k9WK9Yu2WJXkMFlRaWQOJtQYnOWPlt0OVd313R7vjl3dETk
	 4bpIs428XKjALsqkGPxtI74wNaP18524k6Gv64IjfRLF3sVrhgFvRVEMPBWpKJJ6B+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391D8606A33B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391D8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtqa1528517
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=OL7mQEHYCSQc+cj3
	MZmSyugOTRomMWlrOXLRTXLiwpIxJDgG/m7xi4pfX7AnWWlTSLYM+oLaQLDqZvAz
	j4yfa8Z/zA619xCf2Pk6aHff9oCsH1NN8zOOuqOSsR7xjMk7/8XFA7Uunl8n9oWD
	C+QCD6TQ835NRVubbiiE3sDruxE0ENoF8reK0pwiR3R2+9Zy8h7wzK9qXiDIxKoy
	zrEwv+/In7+AY6UeVDEY/2xiGRHaVZioqOBqn9JB9ELncCBjS/V4seeTnAbYvy89
	VVDZCWkTMhHODFhx5sC6jPH2KJDq3fICfE1sFC3QfTNyjyJzrb42MVAVXY805RxC
	92lkrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso169054785a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178816; x=1795783616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=fN8sYdq+EKflVYz0UK7UfzO9F/QWxGcXj72hVKgD8S00jtQ3Mmz9PurVsthbNiKri6
         iGe6WdiOiD6UQdLCPEGXhejvubNbHYzY4r2vZb8W02tIAQp1F48P7W4Q1fXBtwLfMyyC
         /cBMSe3DpncOgp3BZjD/FbvUq82iqt77LG4w6dM+6+UnCxyXYHTd5oaa17LaNymUMTCs
         wjoGNeY0WS0SfrPPhpRTokpaeQ9GnswVzlx+nKbw/ULlam8ocZXmTe0CcR++yFOjtecE
         ODlmWUbN6rpD4lArqxxegzAYKPpaj4m3xX89B+aItZPFsxkDMJmN2KORWANR7Sd/gpTe
         2A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178816; x=1795783616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=HHgJP7UrEnnDyLYm6ZKKwUUv/Sf4NoIlri4+2U4LGWLv+xvADNAxn4HhFcYcMtH0SK
         Il41X8sbBfRJKDai0aZXJkZwjwi7g6JkcecVeb5aUd7BViZ5xKrnyPUsFg08AxTQaEJB
         1TJyHVFHmYPgQclDF0ztb/Y4ZztjrhaBfmeOdu7EaZ0quAahdjTuebdNzHD+b+BasFBO
         PRJPo8WiNaaywW0CDwHOXyvkZXTZLpHjlrLYPH3y4SPxqFIlcnrw2jsMfmHP9pr9aASL
         PSKu3kiT9laz9snLjgmGw/QyirCUb5+sNLQYeQinDU3kw0S0hZvNeSwt7mnMtmkThyR3
         mkpw==
X-Forwarded-Encrypted: i=1; AL+hErEqfOyYuEKHGpBSxs5G0OTEd9BKY6IU5bF2p9MsxCjrPj3rryv7eHKmIvcSkYSs/c0MSgrejDOiYrI/@vger.kernel.org
X-Gm-Message-State: APuU4Z83tYpsKsP4Hbgf3WmK70UkcyiYcMwzMkhFeIlPv7W5PGGLdGTv
	25kH8HWamCYTqUAbUq8TtBQLU9uxV9rOcvOVJywmF/yXXpBWwyP0po7rWeNz1PqbhsCLXQtyO/5
	P5J1DqEMRzm7xfREWfh0JWf0tGuTQ2qjL1ABpDlUU4zsYmG1qPobZJ/Hba1HRlb60
X-Gm-Gg: AYBFou2k2v3s/fRHVCJoWrLBL68JELSTJSdRcaKrJiFQUMPcYfZtf51Qe3E7G6j74GZ
	C7ZFqfzlccu95iNGu5JnQOJs9sCPIXZu5a9UODkUmI6dfx1nbpNVOy9KboYExNwzgB6ywkNd6rz
	03Ic+yp1LX1iW+U8VjjwbTQuAuXIbunvgekTRyuCAPpcgrj8lNKiaHBOEMk/olcvBf+10uwHLE+
	Qz3VYg1TB8IX7UDKSwHROYVYV5M0zSXZ9IMTKetZr9oQg/SWYvsXAB5ZXZnuUW98ceVzZBpAj4i
	3j40ZKEfUCL7qNYcf1BR3jfhTmP6fn5KxIR+NUrnhn4o4AM50NkBrbWL70P+gLh9kfwcrU3OCXX
	4pR1+nWgEyU4eUMONeYsciTDcsX4BHeeldPe/dtC8c74B5sndGUIBKL1d46pCbLTieZUZ368TC7
	A=
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464269185a.30.1795178816391;
        Fri, 20 Nov 2026 04:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464265285a.30.1795178815926;
        Fri, 20 Nov 2026 04:46:55 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:39 +0100
Subject: [PATCH v3 02/10] lib: string_helpers: implement a CLASS() for
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
Message-Id: <20261120-fwnode-for-each-prop-v3-2-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2jLXmZl1uQUBpEf+eKw/T3UBW/o8UeMEbm
 +gQPCy9bhCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w6OaEACp2HMa3L5w/tLsNIekUn6RV5BW14T495b4IkQjhG9/ndutwkWQh8k7Rk+kY8zCzHvUpY/
 I7kDBzNwwAbAaBNTpYUI2PHBTLTM5NxV/844KBjNOzxvdZib+uxEvQfVpb1z4COHby0Ps4GVQ6V
 qo9cCpLSdcK4x+eTOMDrdsUaLphAdS59/wpD2hdOq4wB3IG227nQOGq8yPhk1vyZ5Y+5QDYy+n9
 Ww8fY3dO6oB7iw299+WB9Uf7WZLuxGdmHYawNxGJBCankEqZB6mm6Pg+7TV5iWPxwP1aYXoAMJi
 MXpThnPqR649IK7QcXRNUYuw6PiIMjc02SJ6KvC8UdhsppqFvMwxjvt52+hjFRWIUC11NzGLln6
 YmzwEEUBhcwSAN4YQCjRhZeGs8Pmu0MwY1Oj269YCXhCMTNSZ/4bEU9uUVXXWAPBAAhFSsrPP8y
 dTbqURJ9+Y1c4cy8JvwQVDm4P6Pb0tN1QBSgnbIZLiFNJQ0ueotPvAGLiSwwe5wb3ojn5oAMu57
 8cj5qte0LROY6R/2pWim0uiI17A/m4pERPD7VtHgmUDbxJx5E7x1HuT1i4ajcaq5rLyF4/uEXnX
 t+7cb3wTQUvva43F8nb+7gz+jraQSNDhscRkDj1Tk1rEUGgn1O1voxd9k6uTTiqqKt3Qru9aXbD
 LBGS8/MxI5yk/IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: FnfO6Tw7YyXkU5T5ycmrR8-V847TXo8h
X-Proofpoint-GUID: FnfO6Tw7YyXkU5T5ycmrR8-V847TXo8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX9ZF5zXzcUWkO
 QxjQekD1RyoIR3wXoPr9HTkaY3zYENzwxhm5+GXugYGh5J6QqWxkf9d/l+0uYz0GpWUw5JYik56
 PPG3PxCX73ieysm1WWtNDH6mZ5wHN2bUcyfFRIZ92acp1/bv/XvQQIfQteU/wGEYAJBJwk8spBl
 ayWABxuzpaIiQPXptpnZATjVUT2ziYJDGfeKwy6JsFcxFcHZ4GdGRoak7nl0u3swLTm9n6fq3ko
 Lz2LrRz+7+pgGm7JxTZfDm8RtvSfxfzK7kYfwNvHUvaM5dFhOZLWLZOSzuj4PxOBADCScWIrcYf
 gyw+FP7YWypnO8l4MgxA5aaiQAC6eWYSIBqtgly1yk8Bav+SBydlof/+nEq+39btLs+DqcfFMG/
 lDkqTPlp6/55Zvohvcbl9Vq7eOZC5OFmk0SH8LHxFgCwWK4mlhlDsV+w/NlglPe6qM0oTbEoiUc
 IpiNsgObItCDgEZ4kKw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004140 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX5RjUFbEMLCF9
 SXVIpH4lUo47s/iass+9AlKsgaS11GnGrMC7ycDNcl0EbAww+aNfFSpqU+12hkPlTYchUGrjMuf
 xMltY1wjLSaDHA9F9kQlBh0+E9d3nzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

