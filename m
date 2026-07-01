Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1936213D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890504; cv=none; b=SHn5Dmc6lORunLrMeKFq3vejVWxpGqW4INybOrUQGIZ6YVlHI5CApkaRTIYZHMLDrlZ/puHwySDhR1lBQLByuctWqbZGETCb4aidfzIf3OYK9GqF1cQ0vnf6oonhQNgP2QSToyCW6VMZCVmkUtuZuJwYqvkLc80NhTeD32fL5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890504; c=relaxed/simple;
	bh=J1xZORF581pwYZ7A+sVpnich6SJ5EdnqbFaBRKQFTps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCUHnUH4P0kjiSdOOZ5CvRPqmDtVTfYhGpehk4xtuf9vaGRG6AgrFVkwIdyrK73lH14+XUxxxDWWnG+h3FmLEUE78qySQxWUjvVc3JhsT1lBDCxilFQAre6qH/lsCP/JHsocVH2/FmwTYXBhHeWwByUT/Yl/Xpz44jTHeHGfx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuZSOsIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUpk18/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuZSOsIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUpk18/w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lTb5140756
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 07:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY+bo4pjlJ+dS/y3C5Am5Wu3YrQCCWQSoJKShjdpmIo=; b=NuZSOsIC1YuPhR1f
	QbBX0Hdh6owWzK7M7amcQHdT9oC/7F9Ytlwx2PSRYjsSd29XN8+ylDqNypSOMubi
	l4O+n28rBTH6fbpIH1fKR5WWPOCntPLUZPhLRJW1udgoV5snsymuZpKT+FV+iALb
	XrVv00DLSCGa7n8+XI3kcIDqEeZvdbOFz8BGbcQnW+8HDXm4g9zuDZySaKkCKnGR
	e9mIgD2SXYA8GjLltCaI6M0Fk4Z26qQRLDaRNAFXx/rlAFA3Esj+Ujx6QQKu6ehd
	PxQbaGWMNDmMK8JbypZujfyLifz9ZqG9mYdWSU4LZEiCGDLKdNozaG+D7N3X41Sr
	8OC1bw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99k3ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 07:21:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b8fc5cc89so37700685a.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890502; x=1783495302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY+bo4pjlJ+dS/y3C5Am5Wu3YrQCCWQSoJKShjdpmIo=;
        b=AUpk18/wKLJyVdF+5CjSeHOB9SGsPGFBfbrn5j8Di/XNafYioOBEev+v6Ne7K2o9Cc
         GAiSgGMwf4jIxjrlT/LdgYMNwRBPAJi7tPZFxoiPMqxEbDL35BbOIWecVhXWHBe6nPRh
         eZD9wfq/XNRb2k305hgqxgNsGniguwHh6GJBQj4We2tr2efqt+nJs3Y9RxIrLHhkS3fm
         twDUdu+VzUkUdmovQLDsR1AzRwRdqiu0S9fW98KXvLUZyU893DaKP80zKWcSQoeMuNCi
         akYlhT870fXQBorZaAuqvzT+l390disarvSWkgc7033GuaFhNV5KhiLjzACHW8bi2ZWX
         lgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890502; x=1783495302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DY+bo4pjlJ+dS/y3C5Am5Wu3YrQCCWQSoJKShjdpmIo=;
        b=atwI6+ztniz3wRp3U6P3r18ovPq7FUPr2KDL9vWSrYYv3B3HrrNJuBAHJgGr1EbvB6
         VS1Ta6y6I0AMKYghTwWUKYpXjXDCeQGnrpoNN0RDImnp+vChC2kI/CG6XG4byrdt9nJh
         6Db9K877L7Byoxc8S786yTrWImZzqiIeftYR/O8CtwO56lmKmLZSAYa9KgHZqZHjuP7/
         LlZCN5RHZT1/cyW9Dv6YpjGu4SzZUDrH+rrZTr1i890PQ4lt7k7zUTEtV8E3WrTFnVUI
         04msa0ohYIPFBt8zrVR3RsSo6q5D8Ap89aQusxroGKj48YAE/hAhrys6KC2B4aMIwi97
         1bvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kpsJwmG0GYZKpWOMRLJmbUZcXbw8JU2ukwbfuHUEE/0aBIrq48liOJSc1YsESCbGyJMMrUDBHqjVN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9tQPOPws8dYX9OZMAv78siWqObXsFQpDBFLRrIlVb8lK7bW2
	V5eCJbWQI/JbuK/NWWP+lKZTVmv1MsRfl/Aqomw+Kt0QvN0Df7eLtsQIJjTo8F6h1L0HAreAhGE
	WGDULan60ltgPc4pelXfDbNMOmxHxOMeqJTu6t0n/SCH+kIcOihrEW9iumTC3dH5z
X-Gm-Gg: AfdE7cmqbucphlMp/lVS3zfZ1IfEdqDxAU5A++TwymyADrzjPEa96EKNeUO4Bn4YBSz
	ocnC7oC0yUfr1c7Yk/H7FQbmaMl6syOheEMg7Yqj0nE+3mWCYXKtj1COs1t6DzAQ+8m29KsYMdc
	wephgI1TMveeXqilBCYwtl8LrISHntVpHp97vhhaVooadyCGJSn5xTN1wH0K0i9bV7tpw9N1Zbw
	WdlREFl1yXvhWpA/r0UJONCaPPjJyoVELrJhEZTAHEdKMe9n6t6bzntOSIA2AhSIJ9U7TBut9JV
	FrPujbNRdxBb7kOHAnEEL64lyC8qpp/HhjyMvxq7qinlF2ku5hSKUr32KZctiDWWXgjSmhbeYT3
	Uyr9IDRToKVjJZ4Ydck47PoY+ERDboQ8I3Hu+HKc=
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr69928785a.9.1782890501696;
        Wed, 01 Jul 2026 00:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr69926385a.9.1782890501295;
        Wed, 01 Jul 2026 00:21:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4fef11sm49271585e9.15.2026.07.01.00.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:21:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vladimir Zapolskiy <vz@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        =?UTF-8?q?Richard=20R=C3=B6jfors?= <richard.rojfors@mocean-labs.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
Date: Wed,  1 Jul 2026 09:21:38 +0200
Message-ID: <178289049121.4488.8904130272670114834.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630145148.4081967-1-vz@kernel.org>
References: <20260630145148.4081967-1-vz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NCBTYWx0ZWRfXzLBx0fYi2++0
 W3NFFQyb+bYDdpELUDCp8jMErCGNMB/VM/yNPO17/+3Aaf0Hro4m6O0BwyTrUmnfzqzugTEdPOB
 YjNUM8yucdBG7fU+pzL41btOQOgL+wE=
X-Proofpoint-ORIG-GUID: unG-uUjiyB7REQpVZ-V7ues6lPuxsBtR
X-Proofpoint-GUID: unG-uUjiyB7REQpVZ-V7ues6lPuxsBtR
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44c006 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=B2hHTnEANBpCF08MRlkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NCBTYWx0ZWRfX7+v8Dr6w2/nJ
 mkzogb5ImB5ubjGtdkl1jlf0y+zzKqiINjzRh5xK3mDKzZ6fpPU3JyTZSW3WEns2YamRfMZcD0Q
 4VNb+fTYn2YKrA6VtZetKYTnJocQIRMIWYEqSMBSQ0a3zmmFJqyItIKaliIuM31lf/V89zH6UK/
 ObtkZTeETndDoVvl2PAYI63/tBIjs6hkbuLVIZxgZ5PCvV6fci2PShrbBE1jQsXVI4e2XG8VAxD
 7g6kdEn2kx3POII2WNxemZ7cM1zz65ZiOSq7IyO7ekozkQDBj8nmB7DQEPblgQmZ0KnAKQhKX4J
 DyZJ+x6jkfNUm8P4MjSXXu2wac4za9w1AVVrG7PzXDl/gGghcvttVtcTeyWxKrkGDR7PLQrPD3h
 w+wMFtJf5qVqaeJkeRQIkkXUFvW+1MNZz5VYUjN+D9Q92CbrZS+w/VEY1naBRR++N4a02hAZ3rP
 0/ywpufEMNSKLyVTYAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010074


On Tue, 30 Jun 2026 17:51:48 +0300, Vladimir Zapolskiy wrote:
> Out of memory situation on driver's probe is expected to be reported to
> the driver's framework with a proper -ENOMEM error code.
> 
> 

Applied, thanks!

[1/1] gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
      https://git.kernel.org/brgl/c/8d7e62d5e9b2d2ff146f472a9215d7e29c7e2307

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
