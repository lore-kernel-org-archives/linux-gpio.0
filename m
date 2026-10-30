Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352740;
	b=zWJBO56QvTkUOy9CaY4ucAloWAX8NaNCTO9P8InoBVrW/AaSvoZbEfwD28LyWym9sIsF
	 d7U7GdcEI3wPvlnxILBlkm2KX3ono+brUlpzVvoIresvJkh8eDhbFcEQUt0LmnJWaxHDw
	 qfq9eoPT56ib6jelH8wUVNzJvF986ZA2VVgoQXP1idS5B37txnMrN27Runff3cpJQZDkj
	 mcbJKTzyD6ntvFeS9HtInlrXqvJBb92herEqwR3SarSs6nL+6mkTVSiynxefvwum3nWj3
	 VuZF3WBlQm/I0UOa/wRTEvNTmQVtbRXrhvfS3NyN3FIwat4PZFszf1PbkMZVpXbfPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
	b=xkyb5PcZBYetpqAipncB+ie0vSha+dLuAIsauZXSnNQfdQpkC0t3vzoUMNpWLcl9gQH0
	 ChPvAapjUFvIjAJsUrQ4R4Y4KYYcBGxdyiG2gJY6jQIqgMR95afRtDTcJqRwQChWojy78
	 RWZcalROIUbvy/C4Jyj1bJq7AgH/aMf1j44YW/GGizI+5TXzokQ/Y/XL2irRTfiS8p3KF
	 8x6yRThZ6ebKZZ5ycyZ7ywRdV7nE+8doK9SpNsgrOT1wYsn/un/N64dDSj59Oqjg0ogRM
	 CxB+y5nfPyTBsydp0k6pdbxeynAH2WP3BKzWKWG87do31R2ToQypV+Yhvdrrgj8GhLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLoxoJQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kXc/cDkO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB04D606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB04D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLoxoJQn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXc/cDkO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9To3267865
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=; b=FLoxoJQn7kxkMHJy
	OUE+6G5KiudaIUeA6hPjgKAbndLuYMHO8oFKkpxZOQcHkLgx4esZH8dyG3Atx4C5
	a3J2p0onqxWv5f7lxHCQbvhp+BgIAX8/GSUVHnfPRvD/TNqaXZqy/apbcBwfW16f
	+Yd5kCdAWR2sU9USQAqsoiQ8h0/ZEn33s9EtBTmUwINtMpRgJYRsUE1FQCz6KIt3
	x99YGFA8oEgYIqfxvTQuMEtFD2bR/RFsG1oXQb//mDcZisnqOU3Rr2uL0ZgZIAUT
	GSb4CLCiZgJvbURNFGQACqat2Qiw4fMRhCE8iRgPBipprGVlRIu1uo04yfxaVpxW
	vki17A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj8wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:32:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so75245785a.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352738; x=1793957538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
        b=kXc/cDkOJOgAmi4YTeN4hM3TSgUOA1AVCwI6nsEBqA9TD73CzwHOaP0bWgY081ZLzO
         ZdLTQFA40oY1Dg4es9mO9IBYmtt5LIOTPOFHyPNEUb1FAZP2DpuMk/pk2SedBvK6O35o
         IyJ7qJuXUtCE5KOsmDh+tl7Ef1Yjp86dke2BhpKmUCXY912n21NbtiYK63FVV2PNuuCU
         bXybNsn2HlOI/M6C53CofZ9dfkxGYVGQJFhBH5rFhDHT2cLHlpaWKhuskbalUHjuc6GY
         EixfyCbQyGAG8otlluSk6bC+wg9CsPgZiUwoqhIFaIhiA3RqPEBn/z2nQ27noNkBdPEg
         hfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352738; x=1793957538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
        b=BLJ8yLgQDyPn3tRh2f0J0a4xh54j6RoX6lEODdbN7XmbYUL1+uA0tjdSz20SvNEbRH
         upv7b7C2+P9sXpAEdJT+tviJdvAkPJcdco2Povdng9TfJuf7zLuPo8Td/nnpQAn0EAW3
         wo+Ig1C/hIU7zDNGXsS1kBW/IHQpw1Edoi9PDhCJ9KVfZE1sovIL9gPaVGfJqY0jymwb
         GxFMGDRQZAxG1QTLtzxVbJ7FBdyfPXGkXJZVFIkYprB6YjFrq1Uzqw+zPANVHAJz7hQw
         Bq30ijPNZ3tKtAhIzQ/2cxhb6swhDI38P3c8JCf7doyembItowep33R0x5XRe74Gl9od
         8mCA==
X-Forwarded-Encrypted: i=1; AKwUvByxX3yUaepv1rGK2Qr4qTe+tVb7ac9A4W+UAZonMlOrdgKGw5KxyEnlnwh/O6qAEn4rHAkvE6cqAYlN@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ0dPHz+7BjMi5A0CgfoPTYRsrnZwGn4kM4p6qc97HQU+P6Lgk
	7dcCVbzoJiXPlJYYaS5Seqp5GaG9q4OaVpziHwGOEoaisFAW1W+jLEH7a7HGuOFOiTtjY5clqIN
	2t/cq+35SbA2LSo5BG3uRFGC/XsN6IL2J+dYOhMh++PfSq7/eiPzrwf5eepxDCvG3kS/HEDN1
X-Gm-Gg: AYBFou0T4i1yf+0FW7zETdTnBY6NzD2hqZb9W/AU8hVyFX0ekIxjzhdZ+AYtnghWCXE
	hd2OhSd36x/EL6JZ8yxSyV/j+Go+FfeGCwet+BkGWEWIktk8zX3CDBnLGk3/iTcreSRQaIjMH+b
	JgJS2oFZ5SZNqTDhp5EBun8AQiWZXs3jsC1ffhBtH5Z7UMv0Hktg0oIleXl7A5bliG/Y6ELROSl
	t/J/Mtvsoy+OUoCzKNMxPOeNlgNFCCwOmvESZ4+xPmlc2y4rwv6VnSOqEvhKG03XU7PwUdD/QGT
	ktr0tF1geXJi8E38h3vk+A0BeYVdSM1oa78zU34IAPY01nt0w2iqtY3/2MPUaUvOIKYXjzM9nAw
	97l88QGBnylbcGz2U1eIaB2c5djqcIfv9Gkhjt9T/wPGIDlPe4fEacazJEnMY2nXiP+7QDFcvAp
	ly
X-Received: by 2002:a05:620a:19a5:b0:940:f224:5a85 with SMTP id af79cd13be357-944217ea7f2mr281323485a.71.1793352737955;
        Fri, 30 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:940:f224:5a85 with SMTP id af79cd13be357-944217ea7f2mr281320485a.71.1793352737488;
        Fri, 30 Oct 2026 02:32:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm43532305e9.0.2026.10.30.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:32:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Avi Weiss <thnkslprpt@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: Propagate runtime PM failures in probe and request
Date: Fri, 30 Oct 2026 10:32:14 +0100
Message-ID: <179335272848.12642.3929434225128874772.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029103626.1527919-2-thnkslprpt@gmail.com>
References: <20261029103626.1527919-2-thnkslprpt@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX1s4hrA9Mk5qY
 fHUsmTOy+yoImMsgf7mBzZdlhUD7YWIrkExxtPVpd68HZwlauF9dWMfL0Skuygy0NsiOUakygZf
 VgV6sJyqlFx8n577SstNprqvaUgbYSqWyEf51GHURwnYiA4WRYOY7U8JaKTeOcJDB77+fY8qSdL
 Azq19cSxsFpneO9/I85yRUvAkjw1lvCLBMjZzmvf5VGsKH5T3GcU33Kb/PuQAgReehw2jizXj5L
 n+Eiok65Km9i+dq1EKkev2wnx08HPcTHrlyi+DYSAQtbCR9s1iuOJtMNJTbPqqRaSZ2/2VxFjaK
 k7dpqEwRzHeVj7agOO5Mk51CGKtwuZ8dTOwKLcmTPH40F6XgjFZ3q7x2T4FLmu/sWnhWI0oWaRY
 1er/x8tK5XLMPaSb+4c0BehA3D2y4iniz58Q9zaADP6zxvHbE9VdkqXylVsHiGJ8OX/8nSROHo0
 0h87EikakHpX2KqMJIg==
X-Proofpoint-ORIG-GUID: PhqgwJxPRYKkbyjlNNKzsONZLLpeuRIU
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae46422 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nNi_UgyaDUgUb-MLmQ0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfXyxm/Kvi8Nh1Z
 ZQ9oPe6v7x8xxqWX7qr47s4Zfe5SObdcTPmnM/+tGRhbj7nQwbPMoDvdJ5J9oDuB9feczYEOCk7
 TPeIu3qOP63XCdfwir+kDIRjFx0A/G4=
X-Proofpoint-GUID: PhqgwJxPRYKkbyjlNNKzsONZLLpeuRIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300037


On Thu, 29 Oct 2026 12:36:26 +0200, Avi Weiss wrote:
> pm_runtime_get_sync() can fail when the OMAP PM domain cannot
> resume a GPIO controller, but omap_gpio_probe() and
> omap_gpio_request() ignore its return value.
> 
> Consequently, probe can register a GPIO controller despite a failed
> resume, while a GPIO request can report success and modify GPIO
> state even though runtime-PM acquisition failed.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: Propagate runtime PM failures in probe and request
      https://git.kernel.org/brgl/c/05be1a99d6d68b24cbe24a191e1af67c70193ac3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
