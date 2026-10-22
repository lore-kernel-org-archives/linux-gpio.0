Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656972;
	b=qqqiEIWEQMTTuS1QyWre473HHo8M9IunEfeVPMX3b1nNyvhnSgD4q3f/doO0oUG90BBu
	 /Ih/K6jQNp8CvzDuI7/TllCszGCivLXs5ym7xhh1h88gWdMm1KTl4bbr2tkM67EfVrlHf
	 KQt+ZMZNzGho9on+KdOPAli5hrScdd47osgZh5vW3Em3oCt06W/sXIkWqFTSBfMmHtmg7
	 nV61FevG9wjAnb5gWNvIxynG6slCviwKgKlHCN3uait23Zz2g9Ua/zyn7PQ0uB/vo0+Rv
	 TS9gnIzNlRwFDVVZONKhRy8mPUvpk4QhQ6p4QIGRKqg4izZJy61kHkp5k8TUZPhTFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
	b=vqYguLj/gL8XYJ0S6VUbVQKkStGzJ4MT8hhJ9cV8wn4f0aWF6eCGNOyE2vo/YW0sWCfV
	 amVZbNnkoLbK+zxBPReAl0Zw/mvXort+MBqqQ6LA55E7N/7ml3LbG7qK4doLfzpTg9nIO
	 zm+Brswigqn/xx7L6+CHKptDm/XF5Pjt1vz0YMyGPz8NxWGGT9Qq3ScS9s94yDgIdDjw2
	 se5JirgzWTbrJhsipmB6gSkNguj1fBmFJTBrHccgxTNBO9bhfWFDWHqt4FcOHSJSIJV0p
	 VtyDotrSYOL71EyILacDV22LR5ULYG+nXu8xf3LoOm17+0kiuJBbjLipnzamiuvNUsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAKw0Jpr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+o5pPdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD4606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAKw0Jpr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+o5pPdj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7otcd3137130
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=; b=bAKw0JprCA4N2ISV
	twfPIhZgmFGnjRNpHTSMuRV5pxMVemDo7h5jeDV2KUNyfwcVDLNMoPBm5UXokYkD
	NGQcFAvHMC8dnZOwQ/8QxHsT25ICVRvfDafZ35Typ8Pwsy0W/z7TO1I3eElC0hcV
	Yf+eiD8Hq1SEuuFvvb6hdvSuxvJlYJas/yvnavVR2GhV7nuPDiEZsVMZCKJgVnWR
	++9URSviLswID0uVlYDcijbyuJBs2+dVsDzHxQ9jly/yGV3wKFRSTMkHxpKTP6AT
	ysZ9L8AhXPJMSoZhrJ0ivWSsQtWz1q3D1MFvwCB4m3Pp9+rQLmwGE9uzXUqUVsEF
	uoPjvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asbyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:16:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so335186285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656970; x=1793261770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
        b=W+o5pPdjIuKl1y8n+4O/p88ObLvutwxfJKuZQOGR+gLjVcdPdxaioDVy+hqOrD2a+y
         KZ8ct3k9hQfYYnovIhtNXpVHDIU3LLk7119Lmn2tZHvu8m1MSyAVKWk0lBpi0OMtOv2T
         92RZygtjAUlYviifTGEMQ6DJeHPdhTfPVhNbeArzf5llRluB7i3NZSmsn4oUTzCiffaG
         RSzH8mLZE8nsNM9cl/qBE+bAljAo7rhmxBwXptdOq5zoPYPRmpi7P7fWCNdMLlZgfEQC
         MxnwJJBwezyqPPqP+CSh9oNJLrHrgxQm3VVWO8ZMF2rQ62hzFcOgJ7VVeDf7xvGAFQLg
         0J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656970; x=1793261770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
        b=nlqdTEI/0wwI9ziFXOdT6ZkvUigx+76k77RxQW6uFStKh8luWiM0RSPBiOh1VqL8oo
         QLqv1b3RwawrI/bW1GvxlbNLG1KpGdf6fbsxqScLSh7LRlwvQLrdP72mh07p+d4CvRGp
         3zqPao4tKS/Vf2BNFsoW77oUoTBQtVQaWKOquFPp/4kNc0owhKyhmJwgJLsNuLkpDvBx
         NNbDkanufX6OsHjf8gfo7NHst4o7wZoTNVjSMkictmM885zJAWHb3dQFcsNl+lreN/TG
         Bhi9z4jARXY82yG4X1p7nlPmUG7c29+F6IKd1FgAKfzTCTZ5SBpzkUWjTHBpwvyILi/d
         UI6A==
X-Forwarded-Encrypted: i=1; AKwUvBxMwB3mCG3AJtwf7OLgu7S1geGW2rvDMRVxng9c7/fQuGeJSUb+2RnS9F8UHlgsGbsndyn43rMTglxu@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ3RVwwi06Xfx1m2xI4SvEDkPCB+1b9tsumPnokATkNXTqzoUn
	xvjsRIsffgFG+OyyOSdQkgVp3xZxhpKMcZaRkNlmi9YH4BvsOEnIaqodiXIFjrdvq4D9CTH8ZoZ
	H8iL3T+oPdiwAlcfZGh4rfZB84ps9TY9/7yb0Wh1tjDmmwptyolAzn7/nSD+73IWd
X-Gm-Gg: AYBFou39HIlVud4hhL01+gwiLpbQOGiJjYNUfEkomxtsPcWLQILpEYIRAFIhsyfV9t9
	V8QdfkcUtESkmiAGE5r1y54WqFfQZMBL9xiCBmzB0V1bAVIEqLCEHadrUDwwFwmbarOZKLxJEy5
	ePRPJ5luvqZjO55D0OqZVyLjAkTwmdqJtU2OHnM+Wjm6P5nJsdqWhUmmnWR2vzCfRorQd99oXZw
	09ZAGOfJ3/FuLz8bZlG3EApOfwPdc/SOQjX6rw9r//KvwX8gxryoSq2qLmtlPA6ygkOrsYqlQOj
	4qaW/9TUAPEuxP5pbR7H9v1N8t1np4WWj/b+vOULYvPNG7zqecSc6Qe8YzZ2oXJy7RRde7hPfbd
	IRNtFDhjpccNqIXJ2PQQQbHYhOOg=
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr852996085a.79.1792656969745;
        Thu, 22 Oct 2026 01:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr852994485a.79.1792656969353;
        Thu, 22 Oct 2026 01:16:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a3e9ddsm48541225e9.11.2026.10.22.01.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:16:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Propagate emulated drive errors when setting arrays
Date: Thu, 22 Oct 2026 10:16:05 +0200
Message-ID: <179265696338.42291.3740879343295270768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020172601.221861-1-pocj8ur4in@gmail.com>
References: <20261020172601.221861-1-pocj8ur4in@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX8lCRnVeelEaN
 ulfE9h6uKfJSHCTubYAdiH+MCsYrKL5448gWeCxd943/eV1bBBetBOniDEn4fl1KCcc1NzfpEdD
 xUI9uOYyl6lP1YXBsz9GJG+kLViQH+edbrJ7AH8rcJHVj+WvKmbvGa14oVKeM7XvbKiidpzbSaP
 vP4V2IUZwSnlFABXT8wVlMtQDRSBCooVMMahvMka6t5PmFpokY5B1vW9QpqtHYnbnu4UaWCS+QE
 6OvFx74Zocza0e5IQtNpkE3twNTW6o77FZaFC3+nZxrIW6UxC+qCgtGb8BTXLGfgZtG/bFnvRS0
 JPuszOPM/0I6pjShyynLulqkyiNxg51nwnpQHDtlygu2oKwfP6THwJkRf145H0tWrL1nzmvM3BY
 xb4/31P1nANfBFGlQp2vrs3EfTdX0T78aV/LFZ/WLHXBe6qjeEMozxgJIPS2ePKz/wrBCM621Oc
 0g0FioH+fIAMK/MVogw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6mZTWosm1bkp
 y2cOaXl5hf8Ry2q90FZzmCueklYTI3Snu08eFaXhlX/ZaOEgKODUq8CCaCp5/tmb3NQPyaL8l9q
 +5t9fY/oAahfA7RvcwmEtQrLy37iQtk=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c64a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7IdmLTEX9yuEVjg1BqoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ctgA1crecz3VOT526o6HOuEvH-WYKpWp
X-Proofpoint-ORIG-GUID: ctgA1crecz3VOT526o6HOuEvH-WYKpWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032


On Wed, 21 Oct 2026 02:26:01 +0900, Baek Kyu, Kim wrote:
> gpiod_set_array_value_complex() ignores errors from the open-drain and
> open-source emulation helpers. If a direction change fails,
> GPIO_V2_LINE_SET_VALUES_IOCTL still reports success, including when
> updating a single line.
> 
> Return the first emulation error after freeing the temporary bitmaps.
> Keep updates already made to earlier lines and stop processing the
> remaining lines, as for errors from gpiochip_set_multiple().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Propagate emulated drive errors when setting arrays
      https://git.kernel.org/brgl/c/15665047024e30f9c2227563d03034061c99ac2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
