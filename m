Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179513;
	b=VuVYnzDM+F9e8x05Yu4/Iij8vGWNBkVNJBGn11/ZPBTdIkWUZBFMZhZ6Ob4/svbFkiRg
	 e+xOA0VzHHa2eTaeHkvY0L/tF/2Y+HrTxRDH/4I0MNT2wxnhPUwBDkcfC5gsKAVD1BEm/
	 5IklwZmatgiTl5hjZs6mOjOIkKLbHwKPD6BsgETf9IyR1j92TnfSWxqFESoHjOh6A88n9
	 1VaOqhDjztb5U+lI+9EcfbeLGuw+byC1/4ocYYabyYy2cAfn/o4ovxYGZK8jG01yCAk3/
	 cLrlepYYUm4woMDIJahj/ZFf8DzGwQKcIGdRSxWidTJhleb9Y/tS2awDvagvU0SXfVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
	b=mHvJtfd2fWTZhVNZ4yO2gtmLkGjqd6TM8M05ZmpIrLOLg9XPIqN1AfGDHIbrx7Nu44A5
	 Bcl7cpQFE7HpPgUSmc2thsd/qSCQWcMlKC4saRrFmkB6yliZ6JTQ5uDI4otzPLj0A4k1l
	 hZtsF9s8tg4n/0sPHAQ8Fwk6vqsBr28a7IipZlQ2RA0kK9B75RUZWkaOWVWqEit9rSUmt
	 PNwsDGuvxpB2wntEJQrxNMsH8kHJyd1eyHOiUp/hEhzM1Y6DieJ9e2a/w6WKUSMINOxxS
	 +uPJqXZ2JgAS/lc1mqrCxzbTrQw1EJd0YpeSlWu94zu/G/S75H2kMlWTF2Eb8q8ZgWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HtxcpXB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxJOY0J3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F9606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtxcpXB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxJOY0J3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K15N3892606
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=; b=HtxcpXB/qEuNxXAh
	t6AtZymXEhq/oIxoneT4AnQhSEjqzJ22A46Dc+e9bAS8iuhbhR56XKtHLh9+VPGm
	KFux3upeU116k7rIZtCWnp5L4m4T5RXkJsGFm4T9uGsfcRFNJjmZLOMCv8huhVmo
	xTtOzDNYxIf93WHiM1xF+L6xJTa2GI040EVhW2yddZZJ2+/6tAEgxfnTJscgbHXe
	LiKX2KZqIAll0HDii9ZwnelYD3Sst8kN3YdH2IGFNIpye6OHS4P8jZuuotj9vAuh
	SNkC4oup6NJWLpYPhx4iNVi1ppFXOxaT1VhXD7Wf0dtF1zMZuoB5fxHmZYkiWjH2
	fIz2nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91qny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:25:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so64667485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179511; x=1793784311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
        b=MxJOY0J3OqMNkLC1KxCj5oRaN4hl9/6Av1RsmlKapqdTrAW8Nzn+oQuMyCIRE2JMto
         AFD3Mjm+pC37vXpMwVwlTQks9IjP47IbQCFWrt8Kln/7iypyeZhJbnNy8lOoDeTWT4OS
         V37ophdbDcbfovqPVnfx1nrucsR6unHJClbq30CPgsQyjpMw2q2N8F0VfbdjumOIdwW6
         KQwpk8JS8vW1xj69NqjwRT32J3ulvQ8Q3BvKDVV7+WRllJM1jqGBSPkDo0XXD9U6gzaf
         Q9ARHHkvLsudUOWmc73UbQnzwwa16nygMZJvlgT7fkl8EXgeO2AM0ZWGfjK9ZRTb5ieS
         XqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179511; x=1793784311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
        b=NC4IdIA+vqaptnAb2r81MXdkB2pWyJ89pG7/iSLAuiQD0ZAX2pcJwmU86sDnJFv2Jf
         TH88THrA1T/1K3aEeYrTfZ37mxWVHRD4FAo3QjBsEvs13mZFW/JMVE2EmfvXLYXdHZEW
         /t+kksrNBtx6MFRSFvmmw9HBN7x3190lvLhavA07A6YzZ+nIdqfxPsXmP1oogxT+JHd8
         nnLj5vK0EcSNJ5/Brp+QzIW/Xia04aC5JSnCB6KCnmi346SfzuxzeUwWveHTYysfMhv5
         3VwIMOpIWqT/fmkLWqu6BmJo7tBNkjaHk2h0t+EsBUeRFcdCgNBFfTjDDm/ZmFo7aPuC
         /+OQ==
X-Forwarded-Encrypted: i=1; AKwUvByHoAiSjevoaLaUVtAGRV2LpEdAjr429PQdauJB0AYFnpk2c340sEIy+tUrv0mpE52yT9RBTd29my6O@vger.kernel.org
X-Gm-Message-State: AFq9FYIFa+v2kmufGHts+ngEf+nX7GHk1hvKCniVVbfLZsPJXRas3X0h
	fZKoteb10bgXuC+hDY8H9aRVIUS3cUdfVpNtIs44mlogX3K53YQKjcJJrPA8vnw1rXCR2YkNs0s
	c8Xw07RJG291eqioUFomU+TPDwhDBeA/nTfrjA2IYUj0kTKcfcK/rOCI5f1vSccAq
X-Gm-Gg: AYBFou0QLlpLu1HA/OyB0/wQ0zOw/R/8iUpdNVjN/WX1LO1GJ1/QAloGQc+xvLHqC5q
	azpHLFZ4YyjoomiltAlr8NVSoyNdPsB7R9DNzNWZ+zrOqRA7qrqf2NHb9i4ln77bCstWG/rITC4
	J9wSRIvgUgtTHG8+OMXVwZ2MDKRmf2hrxIWCHSbSw8Op/YNgn+WUryigJXDoBjq5unxezImVpSh
	bnSCdqvSeqhyZVDuIMnqPzQt7Mdar0NK7Pawnd0KIOQDKlQbEI+RLEntWe7ZWmiPg8ZcBVnof5G
	cNH/t7UpSCOS5H7vKuW3Gc3AME7Hl2+fjGUS6U9hV+l7k2cJV5oo3PjTVZS9m+EsGVDuhewYJAN
	ju/p84Fr8/Bi8Nodm7ISj+L8SGn9NBYpg7/x0Es6jBk8B0kwFatPiVMGnuKCYfkwHiZU95zYMss
	AX
X-Received: by 2002:a05:620a:26a0:b0:939:b8d6:9b1c with SMTP id af79cd13be357-94408a72eb2mr214268885a.19.1793179510716;
        Wed, 28 Oct 2026 02:25:10 -0700 (PDT)
X-Received: by 2002:a05:620a:26a0:b0:939:b8d6:9b1c with SMTP id af79cd13be357-94408a72eb2mr214266885a.19.1793179510221;
        Wed, 28 Oct 2026 02:25:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm19434555e9.2.2026.10.28.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:25:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Birk Skyum <birk.skyum@pm.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: Restore the pin configuration after hibernation
Date: Wed, 28 Oct 2026 10:25:07 +0100
Message-ID: <179317950511.9885.396157708908521949.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021210425.57066-1-birk.skyum@pm.me>
References: <20261021210425.57066-1-birk.skyum@pm.me>
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
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1bf77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=B8HrD5q8qNSOtOt7yzUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX+Rlu66cpwnTf
 nePhBRPykZS6U7V0Ez1SdqibXeEzLMkT4PWBF4RFZ00miOsqM1zh9soVgGW5cD2Qhu3FK+SMmh+
 TC95ye5/f8wxCZ4i1wmHinzu30KFvkA=
X-Proofpoint-GUID: -vRwPryemvcmlfGPTqa41BHAuwelGWNm
X-Proofpoint-ORIG-GUID: -vRwPryemvcmlfGPTqa41BHAuwelGWNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX7b8GueG6gj1/
 URoR4TQJPo+1Fiyej+HKTfkq8YVPpWZgl/U6Ed9qLLGaEDN7/z7Ax+vPegwSUcJhq4t2pynbSvW
 cC8cyKMSMc92nxJC02XnSy2kUvlXBFbgVkrB15zVONHp4Ll1y07m/vf9egzviySw9ffWHr2QC4A
 KNqe5pyQithGN9FJczNQFskdAWRLGj3ejLPH0BPT/utfNP87agWZ6QZ+faOIQMekwCvfQZBGYvb
 Ma50VcbtOsNSVoDTSelL0ONEeH7mrFAPKB4wF+u6Sa09FthER9TjqJMYjqaG10uHSGMBzK0P1+a
 YKF6gvaZUgZV34+vBPVMdm0AeapCoi2CJIjwyXE+zwceeOgSnEmsQ2ztS7g4uEYKM5I6BTDKVIM
 As4/nkQJ4jQsuHkqcWmBOKjDOJ46tOYKFpaJMOB+YbaZXjvQJD944EwcbCM86j1aMQeq7YhFCel
 kHYa4yORCE40EVYpQGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280037


On Wed, 21 Oct 2026 21:04:35 +0000, Birk Skyum wrote:
> A hibernation image is restored after a power cycle. The TLMM registers
> then hold what the boot firmware and the kernel that loaded the image
> made of them. The restored kernel has the configuration it applied in
> memory only, and nothing writes it to the hardware again, so every pin
> that the loading kernel did not set up the same way stays wrong.
> 
> On a Lenovo Yoga Slim 7x (X1E80100) the Bluetooth and Wi-Fi enable lines
> are two of them. Their drivers are loaded from the root file system, so
> the kernel that loads the image never touches the pins. This is
> /sys/kernel/debug/gpio before the hibernation and after the resume:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Restore the pin configuration after hibernation
      https://git.kernel.org/brgl/c/30d9a180c86e3cbd53efb7152e05cb059112f6eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
