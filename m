Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF683E5A2F
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141286; cv=none; b=b7XIIXnVI3vVZg880MWgArMbRY1VPmQMNU14lrYQDBq9gTfFcfreTKj/WcyQX3ccQQTXpYeOr4k/mkVfJlD4vWj43ia9Ii2ysaVAdYznZa7e0OoeVCF/GVMz+4bJV27VWIRMvld21GLXot3f3H54oLcigHWJaziskK9CCxTqi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141286; c=relaxed/simple;
	bh=9u2kKnDX/HmSD/5prrmfnP15yYTfnWpzqOSS67OmG7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnzVOONNMimwqxZlirm6WORPxarsJQtXyXon57501OrnpxRIFkUOSaJadAB779Z8pjSPhcfsvxcsKVNreHJ8q4oEEZV1UPX0Catd8fACtCWGUfQf0DXxmx2x4f2WjFNgCZzhTMnY/7H9wvEsW2UgWnT1fg0tUWZ0fr3Jjy3Id+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9Rc4iot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ6i1G+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9Rc4iot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ6i1G+j"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lJVR303528
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgRtMO3KtPTVu+iC+z1x0udOzvLloACS/goI7lMZ9mc=; b=l9Rc4iotWW5cG9a5
	3iVzSC2jOhy+l3QhXhDXCOKFEvzMft1bqiv3cBsMA1NSCTyN+W7UgyRRnVoGcCSV
	gspo635s9sblD1f3MqeySAJb/SjCJQok6hA+l0gPf3d+QD+V1BP1HuEcUgg2XWtJ
	+ZM6dtAIib5Dj615IP1UslCsmMCocX+oAhE3nI9u+vEtX/gol9JvirWHfXKBFfCX
	vJ7KptZRdj6YIyh/HvRmSK6Q7N3tsDoVmQ9fmvZg9pYhhTAW3GmEjQJubOAyyOep
	UEDWDrktAdyg1q1sE/DFcBvXmGl2wo9KuCzkMMAeRCmzoAkRJsJu/oqKtj4GmWPj
	ssqQcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt924r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:01:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so9130385a.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141284; x=1792746084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LgRtMO3KtPTVu+iC+z1x0udOzvLloACS/goI7lMZ9mc=;
        b=GQ6i1G+jHEPr3lUC8YvTN19QQOljaZcf3pNMI9kxHlaCAR1iDxsrQHZTQ7ZDzVkdrj
         6TZP9TGDAQUE3nsjo/oZjr4kNtilILzucEq9g1CAOxq1ebvzV+pIv3e1kjht13kJdhDO
         43csFbe5zcGXzreo3W4GuGEHlQzUI/pSPjfvCGTsz1gdv3s/4ISsZo79qpiGvMJCtaGW
         h5AIMlCe7p/OvJ2jYYTqpfKLdgivNghriP+pY03kg1PQUi9YfI0M2h/YIcDvQdd2UCIA
         MHvAVg496wT0TUlEQELBCujyR1LA1RbpapSrMoEBT5ochkX8Q6wq1xNdWdIjU8Tp41lX
         E66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141284; x=1792746084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgRtMO3KtPTVu+iC+z1x0udOzvLloACS/goI7lMZ9mc=;
        b=gJMikjnFas7mI7v62EhWMOo+1Al/9y2ezb/wse5FFSctAJ9GUbnZfwPIy9MI/Zw7Nb
         gE48vve65eRnvLu6GN7RoETP2h1nHVZSVct3wZr03tD9qZV7plKDNUhpqRq2juF9DktK
         ywQBj8smymeLXXqxEupHpePddDkJxasnS2j/Ym2b3hXH7YB9RYRlFvQxwqHYaM310PcW
         bFHOo1xwQB/UJlPR/oSeUgISJlAO1zmiwVCG7umhTa72e4Sr0GdXRNVpnrDEaZUy8cm9
         TLakM33+IiI5emeZPSGxzGfRX9O6qd5FiucgfEie3tMvE35sIWo/udgAQ7n7N3RNynxE
         xWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvaj1Ae/zXYDXAxVaUjZ41If9XnI2weYPtnPSyv/FINaPzXV2ggKBnd7CYlDIAxu2/ymdoAMiC+fHw@vger.kernel.org
X-Gm-Message-State: AFq9FYKsasE4jcRcwXELbg3bYqmmv8RnAZxXPl4aR+S5CWewPEVKBKr9
	WkxgubdNuMrcPQ7Zi3CCbMj6t/YZgbQg1EZQlz67SgkC8GyUdRMSNbwhTnF1G0Y0wLTpbRn+7e0
	H5L3LzlTeIcPSKOo1WjqDiNsngiLSdMJPyuPR28SnYtFIbfuPaTpvvlNSRHbSdYYJklLJX/gH
X-Gm-Gg: AYBFou3OA406p2AAVqp1GIFu3HbR/QduRPGbfxfy+11OsMEJ+1DXhTeE9TqxtEBCTtA
	F9SuFzdOtVpPw3iC05bZ2EYWP7KuYfOTmHLL9tNXHKo2yX82qOoawEFX0ZXqY6KQcS9xr+8z3fQ
	o49EJALn+XRe8oS8dAOmwHn+Cy0d3s6qZkikgugfdahYcktPQRXFaiXX1uFM2cXUuPhr/Fn2dp9
	2J5F+IqJu1dfLKd1PPd1R8qVupVXBE9CPxGCmz62YOCEu3ZVRT8KutMk9LdqnRQimNNkcQI8WfR
	aSA8gwAnRkIdgSbeT67AHA6td+olscN2jZwoqalCcrM9LHOyACBM3Cnp49wTVAyhKVVkA3oBgVF
	huObUkJkbaeC369wLG+UwOdM1SQk=
X-Received: by 2002:a05:620a:4629:b0:93e:c12c:fbcf with SMTP id af79cd13be357-93ec12d0664mr3309744985a.75.1792141283877;
        Fri, 16 Oct 2026 02:01:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:93e:c12c:fbcf with SMTP id af79cd13be357-93ec12d0664mr3309741185a.75.1792141283402;
        Fri, 16 Oct 2026 02:01:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8abfae7sm19101725e9.0.2026.10.16.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:01:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: westeri@kernel.org, andriy.shevchenko@linux.intel.com, linusw@kernel.org,
        brgl@kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        Nikodem Sanecki <nikodemsanecki@gmail.com>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Ignore GPIO 11 interrupt on ThinkPad L13 Gen 2a
Date: Fri, 16 Oct 2026 11:01:20 +0200
Message-ID: <179214127561.43403.4930516828077355711.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015193924.4081906-1-mario.limonciello@amd.com>
References: <20261015193924.4081906-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXysm6JipDDRFp
 KNkY4O9q2WPZVHrRnX27hYgA9Aowj71RAbqWrxbjn8sOGchad9YzAI1X52ecaBObjkcYR97PJJ6
 QM2ohaIves0wxsjyj6rlldaGeITpY0UkczBKABHv1V8j8nsVOecZlRYOsa0TE/jL0v2VvzLTv+U
 zU6hF4IgJ7rDLeF9/Tvw3hUOe8J+g5AQ3EMJWoBAZ3B/vKA1pEh6V/y79U5ZCZ+rSMgxsbiZQoT
 5AVHcrV/zCh800oGiugVcfqLkf5VIbRM1NrLe9/FyGhItZUtbGJ4kIIvIpF0LQIRAk00qrrR7iA
 k1pug6P3ZA45m+Sov6gVW6diMschcXhWqaNP6FA759BhY6dYb5xtmA2vMJ529plCyQa7HtsHhT0
 AnOrq4LaVQVvKt8slS/5P50pnzPmVD6lmHTYxPwEgXgPr4lhSPjUOH0fNl8ieFR3rnOGCWVRVyC
 uJLJZi7U2VxNoNhe9Ig==
X-Proofpoint-ORIG-GUID: tYJFuu6Y6zbC73pobxyo7XVnJ7PjVqfb
X-Proofpoint-GUID: tYJFuu6Y6zbC73pobxyo7XVnJ7PjVqfb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX2sggkH9mdngu
 eVzmmNL8ZOxE2S+A2zdh79XYrzM/K1Myc5oXE6lhFe3KZFGqvpTfNRmiGn36VAEhZNLIzwNEEqN
 kxa8xNG7SaQn0u43tlFN1TheY0e9xiM=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e7e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z07AUoqqrmmnNCNeWx0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035


On Thu, 15 Oct 2026 14:39:21 -0500, Mario Limonciello wrote:
> The ThinkPad L13 Gen 2a firmware declares GPIO 11 as an edge-triggered
> interrupt in _AEI, but the EC uses the same GPIO as an output to drive the
> Caps Lock LED.
> 
> When gpiolib registers the ACPI event, the pin is configured as an input and
> firmware writes can no longer control the LED.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Ignore GPIO 11 interrupt on ThinkPad L13 Gen 2a
      https://git.kernel.org/brgl/c/ac46dac1613a7c971e28e16d3a7a6ad4b1ae6c5a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
