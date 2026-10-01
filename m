Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2F48EC75
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843888; cv=none; b=iuTsA48aDqzEoZqfmcpR8fYXFJDATmisVg9AymkM+6qo1w131ibDsNRtLKAeR+j6FArsnr1jp3IgG14+ScTrUwqkomsrpEaHogCVDEczV/VqEplCFvxJBim0zgbgx2rzvGpjcqh9w0C3H6vFNK+eHSRKiIelRhOXHKItOovqPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843888; c=relaxed/simple;
	bh=wc7M4w/D/XLER6VhJuAapoGC2n8RXhCEmzFaHjuFsX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APwTDX9AG7OTB/u0UL2jDcI6By07xr/W3kGZAiGXHItu+12BntuovshqTEuSWLD4LMgAhRHay7urA7yvxH+/uppy4ww5pTQ/yXJes2OMcn5awCjx0Qu/MgRHVRROCjt52VVqTYCkDTYQSR4TkN4uXxd0bWTV6/ctw1KYSbmu9Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ddeeej9j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ke0vcbK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ddeeej9j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ke0vcbK4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xofv1512127
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9k8R3TmCezFxNSbj3iVuheQvaH67fnjMu+lJCfZRnwg=; b=Ddeeej9jV3ZfIGf9
	xZaU6H3C9uD+feN+rznq4z8V9OlOqZCS3IjbaFOfdlQpqv9zN/Q94UOWNQeOFujJ
	ijETjsbpqZZmqm1jGMXEvBLNQMuOWUiAHRaSxRNx3239USJnjC/Ec8Ll/02YgtZz
	J2FPqlU6iR1qPgXarI8cjqAbNY18i8Xhq5k68Uhne/tUXjIRdyKfH3+oRijfPpDS
	7MbGq9uQ9+gE8REZX0ycuu1sMTDPZjGK0LWfmI8vGEhWrsABAbPSq9a5d/56RkFA
	g5px0SSGSerMv7dE7kPguMqpEGdGnTyoiOWdvLVs982e1IqyDcCa6cxuyK8MDg2u
	FfXBrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stmga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 08:38:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso169389885a.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843884; x=1791448684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9k8R3TmCezFxNSbj3iVuheQvaH67fnjMu+lJCfZRnwg=;
        b=ke0vcbK4icPwwgN12tCiQv93JOu5tVB6vV12FQg4aaWf8cTLU1A+TQTv1O/A5asWq2
         TNI4FpeFdkewQlU1Ysb0Lw1jr5TaTtYtwmTEvrXEXp/Lb+b0ahy4vFTfKFvbTyo2hEbR
         uwOZHd2OlU4UDqmJf14ws70FwlAq2iwtco/gLF5dBGw4v+iw1f12L5OtmUJKt4SwbJ3X
         dWw8K4ZBDmiK8tAq9ik5eWBg/WfGSnmxXeaEsFTJ+mPEO0tCeUHNHtEvlvQPdMIgO7Zx
         ciS+ycmxgZjD9PPrXd0CH0mBE2doj5CvEaVy67RAHVk6jfz+nupJrNkX53C9hhmunFH7
         mC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843884; x=1791448684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k8R3TmCezFxNSbj3iVuheQvaH67fnjMu+lJCfZRnwg=;
        b=KXV7GGIdW+9vtZT3PV8nmf4XNTFpVISI8WqKgaUVaUALVw4uOV6jJ4bWiC8q9PX8FE
         R+R1YmMi2HrXWUVdOfssLbut/4tgJhDUpHlbklK3AYttg98Y3ME03jY5oJm3Fd5EFmPl
         cCgK6zMm4NRxImfNAatZeKzdC2TzTiyJ5INwvOgFmbL2SQTxNVYacLMKwSr82DiOL+ue
         ihi62oWnAB6Sut2zsPmtHfwzdgK8LzKJWlv8uYIFH9o0RK49VaumZezxWHRKxbmyruid
         6OM+3QBsrTMxhwRYDZSvgEDJ7PfRyKj/69Pu7KOman8wbpns+rNu/oQ2Z05mAiCzar64
         7fTg==
X-Forwarded-Encrypted: i=1; AKwUvBw825d2zpjMd6Tr9buHigmi6Q0mnyMOORoFjafVWUaZtKcx8ZFU7fv3zByrDDzdCN7DtsY/WXo+5K4D@vger.kernel.org
X-Gm-Message-State: AFuF++nTQsfjHr4nIqKbHeA4JwLp22EjhAAe8927B21+9hdoONn4NMND
	3eTh+5SqWOJbmPsn+PNbN2upDhMckDSCwWFkqCGiwmVJrS5+hNDTuAhAaEIqMaa0Zmc8t7mu07k
	l/dfNQjYU1ED9avXShqVXSfNCU9BKDIN+NULWUcraCe2b3vut7RE6Hct51y1/tJXEsHpk68k5
X-Gm-Gg: AYBFou1iclTy6pePOKjYjdrk158hD9k7dxI7E7GNhmz3sMbbomNK9ktpX2vBOl6meSa
	eAOM8Uc+MnGl02D+ZFsUhOEdhZO3O6qU7YUggS3GDsz2l03KuGJ1vlkJxvC8eNulQzOMCF7Ucqn
	Y3NZVBG0TC6bB8GSzZQWV1rUiIjS+qBxahOn/VySErHch8LsPxAAJSkxm+DnPfSzbHbu1F98eqA
	dAAgnaCHsCrtDCscvPrPYXFl+z5plWVmC9lpJ6rOJxDGOUDtsx5gS4QK2N0cVSPCaknpO8UZfiI
	Z6IJqkHA6AxcJNT8fmGbmsaqbhZA/ZhBhGgtx8XcITjGnOwp2KDQG4l+4UCkHN3l8oj9d+Lm1pd
	SYkpmeFu12U2L7LmiWkDznyf6pM8=
X-Received: by 2002:a05:620a:2728:b0:93c:a709:e8f9 with SMTP id af79cd13be357-93ca96930c9mr728924085a.22.1790843884118;
        Thu, 01 Oct 2026 01:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:93c:a709:e8f9 with SMTP id af79cd13be357-93ca96930c9mr728919985a.22.1790843883566;
        Thu, 01 Oct 2026 01:38:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ebe694sm22406125e9.10.2026.10.01.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:38:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Sang-Hoon Choi <csh0052@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Subject: Re: [PATCH] gpio: exar: initialize the ID before registering its cleanup
Date: Thu,  1 Oct 2026 10:38:00 +0200
Message-ID: <179084387851.7272.7002049837101602414.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179070265834.12871.48183786512201899.idr-bug-79@gmail.com>
References: <179070265834.12871.48183786512201899.idr-bug-79@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX/zlJHLWHgpj/
 sp5Po3/diWp53l9pcryEvOhvtlZZwhW94ObJsr98VHbaPTvJtV733wnYTDtYuApRkt5/O9tNTGb
 K7mPrTHF16OD2+dnndaZt6Gq96S8egw=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe1bec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FhBhU7E2BDDDXE5UZgsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eIQvbALPimWhsUHxbe-UJ4GkQcprL84F
X-Proofpoint-GUID: eIQvbALPimWhsUHxbe-UJ4GkQcprL84F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXz4wF6zdAhtOE
 VrIzA3usUhSZrhedm2GpEL2jOqBY7oKFS28htY8Q9sUz7/3SrJT9EuAI1+jlAg+P9mmRA1atnPA
 u+WDIfeWuZ1hqXXHWlZ/9IAuil8ZWJHi1CN2ZixOcjDqiMfoj5mgIfgaQsXoQH/NedoLfHT0iqf
 8GtTWZxUU2TU8g8dZn7cGEioW6SE0umQkhMJPRFSE1kUtigYO0OHcsNwfwese2WWoUYz/cyaXW+
 k39uW1S9HWIip0UOb9Ypuk2ss0EzbYtLtM0By+NYPs8HqqBGKJwSYfb0L1vPdnPfoYMarAzk59c
 iCU3KyVwRZpq8q5R0U1tKsDhOm2PM5NQm3dqhho2KTeaykQGHBVTfJO+eCpRKK2cS5QhRnBk//g
 LwZrJA00NV9Zf8NIQoycK7/5PWVPUKg2VxZJjINeS7eLJqOpFVxL5ARt4E7FRfVoEcgdXOcNofX
 gqEN6HExcbieQK1jFyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034


On Wed, 30 Sep 2026 02:37:31 +0900, Sang-Hoon Choi wrote:
> devm_add_action_or_reset() invokes the cleanup action immediately when
> registering the action fails.  gpio_exar_probe() currently stores the
> allocated ID in exar_gpio only after registering the action, so that
> failure makes exar_devm_ida_free() release ID 0.  If the allocated ID is
> nonzero, this leaks that ID and can free ID 0 belonging to another device.
> 
> Store the ID before registering the cleanup action so both the immediate
> failure path and normal device teardown release the correct allocation.
> 
> [...]

Applied, thanks!

[1/1] gpio: exar: initialize the ID before registering its cleanup
      https://git.kernel.org/brgl/c/4d69e74034b208588636ecc177e0dd43a7696af3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
