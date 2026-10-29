Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290967;
	b=fnuFtamIj8yPyqi2DcbIH9UwgyG4L+O5Kf//w6Pcu6TI3/Ni6som1JjMB6T//hdNDFjx
	 dpTfCgWVnd5LvT3ctlxLXT1HHuZ+EjLSnZmMPZVSex4Ggq4e13K0PC1XwRxnAbKAbQidi
	 ZDyEGzyc9CWTEvuDSNWb/X15jOmd/w60q0x1GmJSh/oZmyk7JbYGNlb20yyDHfkTp6Wj+
	 yJM/3mcsh+7TI0Zx0QOIFN4qoIMg9xqDXocA5W0bpAUaykW1IoP5d+Xg7SXqhYMmQtrtt
	 AeGZZ11Kt11rK4Gv7P8icCRixv4FoTteH9yeWEyS43zyKbZ/GBSMqpsGoJysXgpFM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=FpeItnlo+8U1aGQbNcK0Dxgklttde4MidZIxEzomTSwLxQ6I+wSJawfWC3H9Q/bLBltX
	 AbLlunPZKeov/gZSHNv4TxoFEcSi6gIeyDKINTlupE2hwmAguQg8YmhjsNCKS0rOiGxCN
	 K8uwpTdxqR1d2RfeW61xvVsZebkdqHCgrwzwkYhm+wG3NjQi7ohP+DfHXAbToY85+bu2X
	 jIjp0r9vuZtmEZCLy9/C9ztcGUdv4RarJeF3ggE1JFttTzUkwJrobgqFcl/Lbj2QI/n5b
	 Ui1OiyTKa+0kho0KuMJCKBjqIoVjk4lg9GXd6Eh8hNK42vyTshnd5JroD52y9/ZPXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNXbJ0xW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQDHwXR0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAA60A260F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBAA60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNXbJ0xW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQDHwXR0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDSAQ594568
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=mNXbJ0xWGr+ajBlD
	TaVbiEWp13c05/jFniq5TplxkKrhzlSD99TR3SCHl1ZOeqJ9kviGaBPZV5MmDrFa
	ZrRNik/IWaIh9xtvquaWkVVweGTX+MoUEdx2S9+TfN53PmBt1y01wjerrxpyNek8
	M04mT3tqK7PJ8UsIvZ6mRIe3NNmXAMskzPx4LRLTq13XSdGuQOGOh7ycrHIL3X3H
	yQg5ee+uCovqSJPceyHRG1jCt4/+YcZvdLdXa+Q2+SJyZeyojWiWZ7kr/om/JUud
	HJ7qib7G8/SwiHL/PV9YI4Mddk0vtD1neAiCMzEY030Jb4tE7Bd6USXAu61NstRl
	YMr80g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kcse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so360691285a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290965; x=1793895765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=HQDHwXR0ZOFhQSzFDNew2TGFSWDvbMHfFO9ewWCP5kizEGchIar4/ax8975nO4EWFW
         /RAYIPmjtNVI5iKT09LKUhvtoSDoXYzf//hWu8hGatRUvqlfGCk3kz/1U7+hhJZB8Nal
         PL0WDo7KV2xbo2osehG3LdmwIP/QRS16bDv+KymKb+cBoi04C5/Ic2eb3TgLgtcyQDPf
         9k1HymZEVbDhM44hLzJKwVv1BdOmd7HP655gtuzEvPJ9igPpHSw6MYaSCdqUYl0dixi3
         NYvc+VL1V/Q3yl2YlUNWrzD+fHXYYkFCek+n+dppaPmU0WCBf73nWSYiZgNKXyHg7IAc
         EG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290965; x=1793895765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=TMgfzg5p+XpaBrH1BqEwWi8Yr0DuqNCcKstHvIDqvEhbFBDf0e3p7UB9gaPP1mn+6S
         oAsaxVvVk8azW0yCd44Wpa0jw32M5R4hTBiMl0PGZ+w+guJOGf20DPF8EQ2NIOgnTGD9
         i14aVrGhr3Yt4J7cDgPxhkSVK63JTNmsxmmpcYpGEYsldWZOSYTNqcTxfNbm7a2pDOVh
         au3/dy651q4oRtYYmfkUfiwbqJOfURd94xdh3zA4MDE4jkihZtbe/wh5WudzfCYfumHN
         MTRJebfWk7M8HJeVGvRJNBb38aoGYr1aJScSexRO9WSUHi2A0aextlM2Pcp8hGfIczup
         q87w==
X-Forwarded-Encrypted: i=1; AKwUvBwWiU6vwX0vUORoGrnit4w1jtqJuLXOH6CWlyq7L7g2UYDvktSBvb7DhT+mtR+UNf9uo6wO2U51bvA5@vger.kernel.org
X-Gm-Message-State: AFq9FYKIa/L2Hsz+r2zFWyYSHlKlPyzuhp9+TiSM6hFkvUPYoiitFjfL
	ledZxupgw8Z/EfXm0OOgQgN2xxyyLT68T6qgMfOeXb+EN8Tg2wvhoZ6S7k+28Cpt+hK+2Kd1nN0
	JlCc81sH7fQKIKYSs2MMDN92TZBCYxVV0wUJfq0/IxyeBO4c87YqAjTDZmORDDPdK
X-Gm-Gg: AYBFou0bN384nxWIyqVBvhGmifIRJx/efNPeDzlnlzNOtYFtd1wUBYtguUL08a+GYGO
	flcAVhzshKZomz+DOwPB5eeTLgVfr6jUP2hbTVFnuII0FNOBsyXoNnXXQf0A1tbuQ9fXKcbugsI
	Wendpq36DYvKZQ++6REjbhpWTvxhgBL+Uj4uXByA8k4A8UITLotqr2zZIB/mCW0W0ASIdfvdNGz
	O/K+SzloILMdQNrxwvrzX00NGKW6cYs19Y17s1JnF3jiz8ouCqRI3NK6QAKGUs6WxmQM0qxXrTj
	ZexNH4JZjDL+pi0mJR7F62C60DQDb+7ETQ0Cg65pKThvStQRJPIBwrXZTjQa73lkhyilABtHXh1
	Q17NVcj2YhpqJ+mVev27fnypHRsB7Bu2/nwfBSqsNRMRwgarTYEekQqylj+HrOISQ+vPfB8Nc2a
	Gm3w==
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-94408a9763amr931507885a.57.1793290964920;
        Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-94408a9763amr931503885a.57.1793290964491;
        Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:34 +0100
Subject: [PATCH v8 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-3-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMwhY4d7pYkUtde35p+HvF1WKISbOm6vxjn
 rShgf9pn4OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w9m6D/9N8SV4GEp4jPNFK8DBMf7VRoxBUfEg/Zf2wj2ROg6LM6SKWLVOZsPKJfi7Vt+sFD56YTG
 AEh3Fr6TeaapP9e64BaA4/G5niJBCKemov3WVBvQTIfUT+Q0xuZxdY0Ge5McHY7dRefIJBsLbX0
 GLXzXNLoRis5T8gc3zn67NPMoyVhQpiq7Gz8jJ+VXiBJUzXhWiQA+ujMi+ge2bvNHlW9Ac9s2HR
 62fESX1F0Zy6DlX5Mebe0UqT5roOB/ZVskX0NzhV9EYE91wt/X7q641BR9QzMZtp2Awo8xa4a/+
 rkbX7Dt0tYxbBwfqMyLAVGkUBR+R92uil3x0wWSEX9AYA1TDElnZ8oSpYyEiWEZmylt9cQKbj3v
 GcdtC9MgKl5viaL+ZOTyplX1Ly5z4isYo+bgqMRo3tRovKkllFTtYraVCg24vNWFlLWyp70mnmX
 ZILuST3W1ZjERUT3zXZ6hvEQK+CCXqn/CiMAEVQpFY9RXrS8lluMzKzdPCSDGzLUipWKSuWE02M
 vVwFifLIL5sgU2jQv1aAoLzMP7bWUVRepN4b4vU0n0qrqDzFdOJuvLKXyqDx5dE2EPTbjGNC4OP
 yVhYIUvvKEiU1Z87g3Lv3th1WwDLuFV8QoC8GiUcKlw2oTzFBpSpbvM33AWUMCwSL3sQTS74PL2
 g/VcV8eOBGTjGFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXywaU5y4D5ZXt
 HfRPK063GlbMFihxsPlD3bSCYnVAPxAk79u5HrvZDwuhfXj51vjUYF390BZJUPBoQB42GtQkDFN
 KyspbP6XxKCCpUG7Wh0epB+13ZyrMtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX+Ao0olklrPns
 bt583fOu1Bfu0gOUe3j1WPE26nSMIh1ZKHTC2WQRrj9vaNnJm21P+kuBAISXzh6cn9v3calP9fb
 Xq3rsCOBauStAkj01It/lDLrLoEUtv7TYIc9IZX+pEN/BxO3IZ4wVboNHMhpZ6g8l2Z1mj/bc1R
 D0xs9ZXlB1vuW0QxYrOhtToBE1gzkj3O8q+g6W5i69mGZ+aESJ+JkaApgy5VQWGHsYf7kNEVas/
 sQoCDIa7IjJr6Ehpvg5ZH8C+EtVOwJbNT2KMDsIxNxDrW4Vv2Kpz8vcT55Y583sWjm0CEtY0pxU
 klak7ndHXELuivPVwr25oJyRIhE+SSkoDSnBtOZ5wA4AK8DZKRDfm3cpaSKKWbxpFZPPhBdKijj
 1be638EivkJ/kVRWmVwI1w9AiCGKtrXjmpEx4qhS9WGbhi8LH+dFE39ESvAXDIYv8E2+FX4uVDy
 P58t9QYEMayo8WM4g2Q==
X-Proofpoint-ORIG-GUID: 4ikVTeZAunFWiH-2kIEScL4FZVzyJO8r
X-Proofpoint-GUID: 4ikVTeZAunFWiH-2kIEScL4FZVzyJO8r
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae372d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 47b434db72f1ebd35ec36ebdb35f30809f4522f2..043d5daba7a73062151a089b3ee8ccdac726f221 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 ref->con_id ?: "(none)");
 
 		ret = gpio_shared_make_adev(gdev, entry, ref);
-		if (ret) {
-			gpiod_free_commit(desc);
-			return ret;
-		}
+		if (ret)
+			goto err_out;
 	}
 
 	return 0;
+
+err_out:
+	gpiod_free_commit(desc);
+	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+		gpio_shared_remove_adev(&ref->adev);
+
+	return ret;
+}
+
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -624,18 +636,23 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
 		if (ret)
-			return ret;
+			goto err_unwind;
 	}
 
 	return 0;
+
+err_unwind:
+	list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+		if (gpio_shared_entry_needs_setup(gdev, entry))
+			gpio_shared_teardown_entry(gdev, entry);
+	}
+
+	return ret;
 }
 
 void gpio_device_teardown_shared(struct gpio_device *gdev)

-- 
2.47.3

