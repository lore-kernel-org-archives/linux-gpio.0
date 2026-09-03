Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189C371D1F
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426356; cv=none; b=D6XRzbWQuUkLbWOnEAgZ2WRbwqYZoK8Mr2mfnQORrxnAoerHAHobJzYBTrw/dqT/vxR+0J5xdFOwjxAmsMHMEAWwxMhCyQ+BZ+tOlOei8m02J60OLgAorncchRqJJDkZ2jXxdjB17kQ7CJ+JDmEqPb5szolen6NmHZXgLrcxSNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426356; c=relaxed/simple;
	bh=16t1wYlESXNHV1d5ogyVgGBrB6MigRcgzWbD0VDvAwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/rQbVzxk5f+NhVwXaBEtgj/vn40MvSyuSIDE3zyUSPDf8vUX69V+zmt0N/zBoQhuN0V8kj9FRuNoTKF8c+JIkYuE0+qQpvQfyKQFWvftB3oF6Amliwt7i4nbZMkZW5/1gyI8gs2j4WIuSVE1UPy6j9W1aysVW7F96/szmCbkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWPIG1FM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZgOPutP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWPIG1FM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZgOPutP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392WH54079038
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 09:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=; b=HWPIG1FM9bu0nPLC
	UK2tHzXvwg+LayGeffGh5BCVloUbESBnlbVFHaAGDLGUGH/yCg3DrEP+PJAtVroP
	r0iUjn1Jf07kZsX+fmqTgOktxsVKmuOse4apq2e6XHJuOAqquwGb4Ro54YDP78Up
	ufDVRhytFP+dSyuZFt1cSW0WAsA5fusM+et44aS9mCY2ha/YWWrjqIG53/PJjpFR
	8njQd/ycBJd0VTz23BfOSF2VWnegImJBF/GL37o4S9Y5aRGAiQqH3TUDDGDg+IaC
	arwy6CJdoRZh5K+a69q/ukV9OLkN8UaFiUpmFhLLLpcjwq3hO+4ooQq0JSp1/41z
	AUwVPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdv3y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 09:05:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso398392985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426354; x=1789031154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=;
        b=XZgOPutPpVilSUYQ7oX5JDZi0U42MJAlZIwPQW8OspgVknG/NmbG6qJtJ547G3LeZU
         yNW1yYjoaAPo+3ANzqw2gJJ4gksEJ5uBvgYXbbqgewiyy3m/vXOLzgFpi0mJuk79QfxM
         azaS5QWZ/n/GPPHWHxTndW0zYjEzAe1UifjgmWW4hHFf3WWI+k7Dicm3XDPO5b/itUw/
         hNKRd4oD+8/yTAz0JRYJijHCoEfIgOh+aNgWtkmk0ez7By3PdAHJZaeqp/qIDPYRXfy9
         uuVp6EG84R1bgCZ/621Mkq6G4aJKbdV27vyUa0Cim7GCCIUgaWli9Lv1TdcsT+NSapxz
         iHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426354; x=1789031154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=;
        b=N61/nUZRZAYWpBU23pZyFbd8KT6CPHquqttbREAjwhIOdAKad55++384otJfUsY4HQ
         GEFEQIfmKXkBfe/VqkSXqvK2SO52f4PBUm6r/VPi0cUxtgtlTIoQWLVtWMokjRc601yW
         vjETfbNvIEsGz09lyQWnWRQem29iiIGYAIX7w+uZ3DWDt0/5tiqtw1v9CRJYnIoWyl6g
         nPby8v8tdKHzkDvxkV5NQVUAJ1gIlKFfk5O9EU6aGE1/7V8fgdkuhUhzDgnaWW1NMI7a
         BCSvd18O4qF2Asn0Sf0EQ1xeVCIElhDesHEF/wxK+EB7RebStGK82jGcBA46AdUeNVkE
         rAvw==
X-Forwarded-Encrypted: i=1; AKwUvBxmGfhiDb7CaWsQFjh7lR3e/KjBDbSB40+N0YUvkaKfiBU9lBiRr6M/FB7o05Iys969MaX733GnylvN@vger.kernel.org
X-Gm-Message-State: AFuF++lQRvW9OlTHhrQ3Pgz8ydmK7V7io6o8pS1EsGS8OCLUBQxH45vu
	5v/CGebWyRRTrjsWaj3Qw9Cef7rBWcD7IVGRTRxtdY3AFvZD/c8EeAeDjpYo9mbvqt7rU0uC/OA
	w9h0LU5vHJSwXLsh6gLEcgijUQYn6LxPLUBYPAQgxS4VU0tjhI92Hf0uhps8bjgbF
X-Gm-Gg: AYBFou3czZcYe27XDjOk/8Qa8QL2j2KHndxgWAyBe4DTy6oEmyCTMWFLioZn/k6Udto
	2ichcdvbSIvcG89ySxt5WYR9VqeCgNLV76aD3O3ccsgllT3/qMAMzYtVoGaWUOaWfbzB3YZ5VIr
	92NDcN2pQMv9rNLAb9IZZ4ihGPv6CgStWwLXTWvedrfc3ZEby+8EB439MLqRLxyJcQaHL6jaPyJ
	K3Jg/P+pm8H76TRdwp/3M1QHvCiuOj4s2OU+AzhcymXxiShy/1OlRJtnsU2tjN7M9+P609o+dfg
	ZIoo1t2XO4rmRU8HO/y0+OfrWpPALZEH5OJAUZYBJAvsx4Z4lQCDI4AdSBuErIwZtVQP/bqStZo
	pdk5UeYefSIiXSUJK6ynFkqiEda0=
X-Received: by 2002:a05:620a:6ccd:b0:936:78c8:e286 with SMTP id af79cd13be357-93960f3bdfcmr1342723885a.25.1788426353776;
        Thu, 03 Sep 2026 02:05:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:936:78c8:e286 with SMTP id af79cd13be357-93960f3bdfcmr1342719385a.25.1788426353317;
        Thu, 03 Sep 2026 02:05:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13252650f8f.32.2026.09.03.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:05:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: altera: Fix build failure caused by undeclared 'irq'
Date: Thu,  3 Sep 2026 11:05:50 +0200
Message-ID: <178842634831.35041.2924834087804467248.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903030700.132068-1-phucduc.bui@gmail.com>
References: <20260903030700.132068-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a993872 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vs4kvO7ZzleYl6-6OcgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FMwJu3vsfRiuv2lpe4z8uvnQaoVa_HmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXyWD29q265h3T
 duG4TDhy1o428qcaDy6JKgevQviCBIg0PZUdEypP4iZYGe5asHy/OH7cYqfFk9naeQlSZWmDX6i
 jidRHuHrtg+KVDtBQ8vwGiL+zM22Unx5eTNbQNG/R+jxUvVHTSvafoA8mViWVMDjpFKAa23ifvM
 atbwOJeMrjQkNRXBOAJFI7ffTNMNIYNB9BjJe+okM+ZOiRW0ZdZo3ZdvhXv6U/dMEQH7goR7IbV
 SXPa5M+Oivqf+oogntgQ9KnQxbjL2ZNrX72XCCLghsqGbe0Ik5Vhok2aVqNHRLe39fyWmowJ+we
 Xkh8d+reK0lB9egs4SzzyuzbhcFD1ZCC6XXdGLTKdxzoFMqcuDhVt69SEB7xDSOEdsr6aQUR7HC
 V1FeoqvV1WXjTR02FGJje0xYRocJXV/FindLOVb/6hu4xQmLvi2UTQYQu0XbusOlCPCBIrcqkU5
 3U8mrS0gvTj+fvVyFMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX2rXvuj8t9amF
 b59IerojtAWUXoRJpiymGx40pAeI1I3WPx6pcXxUzyEuQDtXo+mBH8/NLPx/rGiNlmlsczwzO4L
 1opG9CykUdHd93u+T4uRkmVIlEQxMqg=
X-Proofpoint-ORIG-GUID: FMwJu3vsfRiuv2lpe4z8uvnQaoVa_HmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077


On Thu, 03 Sep 2026 10:07:00 +0700, phucduc.bui@gmail.com wrote:
> Use 'mapped_irq' instead of the undefined 'irq' variable in
> altera_gpio_probe().
> 
> The incorrect variable name causes the driver to fail to build with
> an 'irq' undeclared error.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: altera: Fix build failure caused by undeclared 'irq'
      https://git.kernel.org/brgl/c/a2cfc48fee416f0ea78e7dc38acbf2ce072574cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
