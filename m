Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178820;
	b=cqzNrngaAVJFOkvz9rzFqWpXtY8nDQgHXD5FlUJrcstD1j6ci5dWK9iAsSiby6J7tJoJ
	 Yv18cuhx5NooLovOpmIzDhvfjg/77vv+dcpdSPDGnbwZyeXfran98frKfqmsv0lMkKF89
	 FvM8QVvoqve7bXpZcmWBjwVeQUSfk0y7RgaZlDGZY4oNs1vMl9z5H/UemNIyORFCRl2Ge
	 NXqAtyic4xkWaFLdyeGIxqhiq50kc7YBQJ/KRfNl+VCnpQ9TTU0IbKAcgTrpwMY0BtbDZ
	 tH0YXmJiktOumgvom/GTHzR/APAiiKNdnuQ5pocqxNF4EWqBFcAX153b02rAjEtImMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=trFhplSYSN930LMRK2BTSAenGnLpFF5tyvFPLCVJcGtxjA/vOm2HFUUt/3yFCZM1zfFW
	 aJGrVEaXbEc/DbtaHgopI2AV684xlW0Gmb2c+qNCSy/rwufm1bZZoOeXgSb/7tgSoI2vh
	 +xmv4Exs+HkiVwcE5kWPlMZk6/FcAIVJqiPUPNRUtykNzp37SakHogkZlxjoO9oD8NFiI
	 4wjYzmMz8Mcj1ypgD5YNa4fd3kW9ybiZmFIb3/jJCCHU6NYtBSs4Oq55PnV4jhdm38cMU
	 I+wBGI6ZNohwvf0lTLcYbBal4+ehv/6iOtGwXwtG1q5eqfJ739qpo6Qq59tGllhmsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC85606A330
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC85606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCKnEh1268981
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=NjEZIDq9tn4Z2X5E
	0HaiSmEYxLZfR95m0e5mOAQrJ36D4UvFWOcUkPlkrAzmdt/SzrPUpH9YNvLqe+6/
	se5miVwDJmett3+70EUwKaCq8F88mLX+WFnVQQmwsmnUpTs5W27KVmO18hMKX2y0
	AuJsOqQMbXBUTBEtKr87UK1crqQkuYbw3tNl3Xu7FVmLGg0qTUAh8niOmNbXLCZk
	WsmYv5U2hFMbGOPUyAGYvNB5Cbj201pRjoPvQlrfAnc/PfFIbzGuskjCh7hrAy9V
	QL7z2J4ER0w02AkWPbiALFCC2e1wLQILLEpsBKRRV3kUWvVmGBHWCC4LMXB4W0p4
	Fwiq8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykqyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9212335e257so21149346d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178818; x=1795783618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=j+1ZjdQE0SlVRXDrtu/Kk0/nKZyNW5BxrPVte4tctk869ofzCViwwjPuAwFH+jeH10
         84nopc2bXBdUeb6rF+i3rthJBBXppFj/lXTfAJzN/Fyzq3Hx2mdDcn5zHQ2vg1Mjw3pt
         bl4LVm7Dfv7qtbwnhnH1JiB2PX+8Np4QnMzndAUGWRQ8uNWXX+qDggp9taJxsjc4i3jD
         V0hsmZoYhz5m1K+pkqA8TM87d5OHD6Y/kOOiF9lmbd6yIP9D+fvHlzuiqpjtAyosCi30
         q1IBG1cIndSY9PS3Q0IEVpw+euQpq1eE9f9D6cp49tbQIIg6z+QRAPLWLSXmyBgi3r9F
         +WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178818; x=1795783618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=cXVPoAAPcRiT4m/3cDx7MLSep+BDZyry4/5RyuDsfne4qdgWMs6BybnxdBtaqbvtqW
         D4gTMwK+qz+cNgoQ2CSMQ1oyxoS6wKeQF82s4eigW/2qbctNa06leOtDARGJnX786acq
         SNwCGKAY0DdHHk8h+vtxSrhwoaz7pB3AnKngJ6iXrSz6+MvZqKZtIZP5NyD5sPt4WqCm
         0kb15B/gVeFSz47CU7BuVLTE9Rb4H8X6MeEpr7qbRVZVDi7LhNVdKybjjop5phGHCG4b
         SjTO15ecIxMSFtonp4vRlQGaBQbu/P8G3esZAMB3HKg3zttOLKrlbScafIt6DQn+SS9p
         8K1Q==
X-Forwarded-Encrypted: i=1; AL+hErHOMbDGP5eXDJUdAnJCA4y0L7XqnMkqj9SFS/Jq2J6ZC26FRquwXRRacnYYKwWhAYPK0GlzFZ8ZtDTs@vger.kernel.org
X-Gm-Message-State: APuU4Z/VVxzrgs8dmcCRhZ4rgAfOszK0Rs5mPvTZamSCgpmLD6gHwROX
	b6/JoyhwS0VQHIO2y1Sy48d7wD5xbeoDlXesRIBfZEN/JSMvlF5qLh3Bxnkm5tYE0p/0Iphe37i
	hpevEEib2XxwaYdzobkeB28gfPcuvAk8wySvycpvaBYJ3TBu1T9V1Vi7UdEf5uNt1
X-Gm-Gg: AYBFou101tn66RjLah9KwisuU79rR9mhr7E/gmuiPUdxlCc+/WVLDczxz/c8TdOb7//
	XD1v+xZ/6e+Z4UoBvo7ejv1PDT/AbANXtwr+xELugeoRZT17lYzvK6waxOUlwNtllegLYD3Qiw1
	oswuRJ/CrOlMNiC0UftFCABOP4H34vNvB9XR0GGVlHJWFn0jIPBORzGbzI4W9hlNjbN4mU3g8tp
	TfilDVhTXtw7xFmkSkF5D+k0XsD6EEQ5gsXrmBJYrcYL03rewcsV/ja6yFJzNocMY93unNW9HhV
	nCA9c6nuaSah0MFKjhVHZvhkO8vr0DluJ6uVyoB/Cz9Je2W6t1Ju5/y8DxELE6Uqskrho0KLPY9
	07viPPih8S9kGifIg5QhqSlKuTZM7/fgh/hMoyWnmhJsbIG4Uxjvv9eOGETlNQengOVs9tz5hV6
	w=
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449539885a.30.1795178818341;
        Fri, 20 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449535485a.30.1795178817851;
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:40 +0100
Subject: [PATCH v3 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261120-fwnode-for-each-prop-v3-3-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2YIXomUiP9/eRkoyZzWQkqxyOPxkHquCjX
 15WcGRwohyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 wyGKD/0aFMoAZkgBZHdI4bxjsR6xspltaKVqqj8fM8pz5k5lJatsHR36nDle+C04E8L3ip3Rws9
 aVGD6HnZjtIDPLqidEbc5Mjax4aHWXq3WpwWO7oC/GRFsDdLYWkQLwbJWmIF3wWCIzIUJC4IrzK
 sOr22Rk+bFBM5DB5p1zXrrSfjdWeHukDbg7JOGPpi9DRSGRRLvAlm2zt9oTbGtSpYA0HQRmdYJN
 KdPC6OGSROSHYkJ6IuteD8y/j4Qi9O0SF+2Zqp7ijy3dHMsKByeV8J3fHXeeNVhZE9RJ5MYKDjE
 W7ViQJYpTz6o+HUXnAK3mXITMsu5SWQMJQB1P/cD4tDRmUuaMbUtesJ7ff1ht5lc7giXdx3zCkT
 Z/uA5X//2XRBWYlV5YuCUD0X5MUGXO0FtOLs3ampXNHoPxqHhegoAcFiK3Scpmm9/L/pHKm4tWq
 itpquAJ7pgNYIpN5Q2G+SS0gtYLNKirsTbuJ6YLJK1XbVR1xol1t2A+JQFRLVCZgYQHEbmPf/4O
 /f6puKDBmqsY53oJLUsXDOo9oB76eNaRY6PTSjf3zt6aXaOMpMUIC4dZKRUOxe6jFqnfroWbsCP
 xBtYg3V63MbfPFDKsCAD7o2rn5twVnaNU6UT3IgF/dRIhm97XwbMbcydQ1liHyxbxPSMMqVv8u9
 6hNsVEEpyC9oJLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXw6NVZ4SWYHok
 3c3IyOCppNYCOWLWn/j1+Snlz7atO52oqn6nrDzUdWaDJoz/MFAPUvKFnCzomSOFSAneHEjfpwM
 40RRW+06u3uKrOcfXyCZDYIaEe8TDUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX/hd8zIPvIEJA
 AXfYrKLdNcSJsH/IRZ9y5LtY9brosdGMlQ04/5oYfzuKT2a0biMJfp4EBZl51DlSXl0axcAEYlJ
 SMVGWgjxloJC6AV9ielwekk0YVB7Zmw8hzhnbXts64TciR4yjeS7f3cqtruymXZFePVrx/Rieri
 14Ey9i+TalD6rnoDMfVQlfmQJnHUxOJ27YWvf4935ADqf87LOIhcWVqrA05u9jGrgIbXBCqwCM6
 NSN7gM3P9o3yElqJnXGI197tVMQYzkIjVFQ7YJ2OKW9Y79V0fz5pDpSgwROGRiFz14QgAFeLuBi
 e7rYjw0u27bM6htfGiXB/bd3FJkPqnoZCwS2OtXFAru7lXFwn820Ula0oPlXKlwZw6Q8/34IaGh
 ctZAqbAZUfyk+se7JCLG6cQjBM0CicRhanBX8nmjwMRwZHanVu6swB9KmddAZcKqzZhzDztnZOp
 STfO+3MuFlrb3qJFX3A==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004142 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 9TADghE2m9FpQlRO8t5Y4IfvjEHhQnku
X-Proofpoint-GUID: 9TADghE2m9FpQlRO8t5Y4IfvjEHhQnku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

