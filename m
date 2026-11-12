Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472336;
	b=NlLvKx1yCkkJ3W4PjqI+aEk/bQJhyHWFMI+Kpl5D5GltC7bdm9bYtBq+4mTT7BANRYMD
	 dkRz4jns8179geSrAYeDTvVuvtZN2mhHdSUUWZTqzsKfVlIvMk0YPUQ+wGzOZwrReSZby
	 lgg0xPNjgXhd3KovaQcOL1fkHr8gGm8PNW5NJFAxJeu+4xhBfFjQNT+lOxJJNW0KaKmLv
	 Etlstay14GQje7fFD+40VQJ8DAAyhW8vwSE+24PTwQ8HiuWwXs0ejrmwD36Svtfa5z9q9
	 /WRI5tUOWQ3tCuJM8rAd9ZwxGqj2Paq/gArf2mQohd/mx9DRNuGV8IX6BaHNzO+19hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
	b=j/OmiImeLVgx7riQTK6kfKMBrac3srzq7EaSVVEVN3TIoKvF+l4c1fpKPRMj3zhqyYGK
	 ZG+Bb0eLMDRmH5Ka0RfGxOeopICoHmWQnhwVY8lNqpH2/FGB/16qhCLTNGkZupLyQjlUy
	 lZjs45a1mt/HKOQLJ4tq9fSgodwBHlm9jpbwF+bgVawwxOjZGcTDFkecgWOkGCbCPxwnp
	 9kLqGvCYhId101hNhH4d/Qvm8ag0F5E6RpfxXd3ZOfjtmEDs8iPhy20p39XDWpRv6/S4h
	 nmI5bMTXeyhQy4uWtn+SNxSiCAeUOQPtm8j3iVL7yLLWRZOsbtbpr9SG3HW3EZO+Kcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrvaoMjX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlbJwqSK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626A3606A327
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626A3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrvaoMjX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlbJwqSK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZhYF3813251
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=; b=mrvaoMjXok1Dlrsl
	WpjTc3NXl9lKsGAg51AWl637hNXcryK+bDkayb1E9faNuI/1UxEuEf+8Me0RGtbQ
	zYJv0HC2hrm6Reh6GkhhbWuTmnudxmx7l/b85pyA40gyKHPEf8Yj4IUFG7H8m29v
	RfZPM9NjBnhNOZ+2QGCMkD/9Dlt5V/riPBWbIVyo6v6r1zo/DRAc+rm69Eqog7Xw
	0KcwF0bghurfy/qD3iCYhBC8r5fF01UbTSYy+gYz3knxVoMvmmNIHs+pGGk5oX10
	39f1mOf7/KjsohUgrRYaHL0roskL5WTFZGkpM4QvPOU5ZEkRKetcwuwOeIhOGngJ
	mV2PUA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jy4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:32:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ecff433dso2623153137.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472334; x=1795077134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
        b=LlbJwqSKEEX9lVKTsnGMTeKhgcq24nHZDNr6JvsCOeyB0vcExZheamdpxl2uNVPY3n
         UsuO7QEXDopG/iJPacbd+CbUbiU4vOBK0PejSXCQvqbi2z1SCkXIcKipmBkX21tOrEAn
         MUY2gbmfw7j6TeiWbDu/6i4o9nGJjFEe7o4jhOjzSEaH9x1jimX7d5uVeerfJ3LjN9gT
         k+OIHk15fwP+U5jA2hnVAy2igAh4kYwLI3GhwFBF6cRidN3jA4RsjZUk0Xc3J83iqfMx
         1mOUtIejV4RCuMGtNsmdz8b/QKogjVejI+lok8GF1feku4Go+g0QrXszSDIxfhx3R1Ru
         Mp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472334; x=1795077134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
        b=2xUIT0bIci6P4ruPwzdCoclaJGSPPgncmiVPc9IJvI/fSzUAUYh9FuTsERL3/7lxfj
         XvxrWuzqJNuUGRIS1gzsekmHQ8npSQqJXFYtAPXYNx1gytz5ENW5UCws+jQTIIlLGSQM
         g0uGnjtJH+9M9Nquuir2GHhglI/5VNya6UNSz5sTaV90V9QQjbZANlY56H85rYJd60b0
         2Xpj0d+sMEcRg4t5dvGFFMbzfcgwsDmw55NzyrYz9yPIb2JxhAV5oua/kuvQdVZAgZFS
         ICoXXaeMcxJJjm+TqPeh3XxGEqR9BSnKXb2w9nCgCiGaitdAJC3C3YpK4QuE8s1uZulx
         3EcQ==
X-Gm-Message-State: APuU4Z+zgevVAo9JJ5T860HWow5CypMcdAUqDq2N8q7xgIlNi7t5etU/
	6bhZDkkCDCiH99Aop++X/euH+HcsYlpyX325zkDjKFeNQR9STgJhs5oYKIAd6xYQ90uhMJFo7jV
	vzG34n1mjEsraDIfHvg/KO+wTWHbQ3++AOmB8+rDvoY5H5+gVXH1ffpnwMioM9sSn3CgIwapI
X-Gm-Gg: AYBFou0HDHqLCy8uDO0nT2iPI3/TAnhmikYR5EBznR8R44Icg53eyjn6cwcw/Jd6xvf
	mNGuVRWAceLwd797Ti/Iw4db2Bn6W7LCo0e/xE7I3vttb+CEvrBEe01wxb84LTgV4gIFv6uy1ki
	vI1WlsQ0HweSyjbT+1X9CPZBw5u/u0WQ8Y81m4bc6LjNcvMUKuwZkEd3BcFwyLrT2YfVhqjj4Xz
	zXUkDxqfF948T3EIbmb+netAtS8k3SU/ZvHYjGmTNtqTeZppNEOe3o7AZ9tOAn67K932p8Zex3e
	Gl9HMTQ4TvCYB7WQnJJfkEI6PgdGagMQRSM+qzU/tasEwmXZokpZaPCxHJf4XjWvFu0CaYfKMDG
	7CRH6MPlXRUg6S4JBJmW6loPRgotF6MSfwAY9OKX5uOklA7bdqJ3HQSxZT4YmGQMFvW3AV5ebAA
	JqmacIt9JNZLataQ/H9dCzqxtqsjm9yGUl9r/8kdjiNXIik0rBUZx+IMNifv3QVQ==
X-Received: by 2002:a05:6102:6495:20b0:7d6:2c4a:469 with SMTP id ada2fe7eead31-7d62c4a0557mr1170906137.33.1794472334495;
        Thu, 12 Nov 2026 00:32:14 -0800 (PST)
X-Received: by 2002:a05:6102:6495:20b0:7d6:2c4a:469 with SMTP id ada2fe7eead31-7d62c4a0557mr1170898137.33.1794472334012;
        Thu, 12 Nov 2026 00:32:14 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm52998955e9.11.2026.11.12.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: shared: fix a race in shared desc release path
Date: Thu, 12 Nov 2026 09:32:10 +0100
Message-ID: <179447232869.4814.17727040416334916570.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-shared-refcnt-race-v2-1-8a0b76e01714@oss.qualcomm.com>
References: <20261110-gpio-shared-refcnt-race-v2-1-8a0b76e01714@oss.qualcomm.com>
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
X-Proofpoint-GUID: AMiIUgiXKsZm9s-lFyxtpJjUtCcePk4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz7XEj99AjbRh
 gv3rs+6DuN/dZL6i9mDtHqoKIsyFR43DbbyLgZDpWUZzGTofzQjufaQlMjcNnPWLEE2gSjb52Q3
 T26l4n68Fujt7n8ftZcZNxCLKX5oLG1Koa+ryS9fiyxgTnJpvzhtQvX0BiSqZUNr+NKsrGzxoq4
 rcGhJamXTjJVvWi1f8dCEMBZfR2KID7GCPtoW19XoXqIgeoeJoEzW1jcJinkMIzQV09YWtIUpj0
 rAy8bjKizIaJ4gIMcwKJQb/m66lGEiyFDFbd5ItmaPzDK00VAX1lsoa5R144DX0oBNEfbkeKsN3
 lqhCEQ+ZZ5PrV7NCuAt6S/X3r7YrxbTicjB/M9105qdlQ+HEhlWBu4RBNdayFdNGrCd6u1KW9SO
 LwVM3CwHiVv3i5/VeEbxT0vlM7XOCiQbz35g4s4N2rcs7sZLFO+VBQ0VWFDFSgH+vjSz5lLiO3n
 9JnMZqGLJwPns/httag==
X-Proofpoint-ORIG-GUID: AMiIUgiXKsZm9s-lFyxtpJjUtCcePk4d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX6SwTCrtXz6pi
 6OPpDcXEEU2QZVNCtjcKN2eBiE1Ub8yNoYHzd0uI5my3G/e7Ehdp62fD93AxEyRsi9NiHTGCNQT
 J6S06zrOVlyRfRdV/kVrcnTfaDkgIHQ=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af5798f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZucQ2ySppxIqqdNBKgoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033


On Tue, 10 Nov 2026 11:10:40 +0100, Bartosz Golaszewski wrote:
> gpiod_shared_put() races with concurrent calls to
> devm_gpiod_shared_get() like so:
> 
> CPU 0 (unbind / probe failure)      CPU 1 (concurrent proxy probe)
> ==============================      ==============================
> gpiod_shared_put()
>   kref_put(&entry->ref, ...)
>     refcount_dec_and_test() // -> 0
>                                     devm_gpiod_shared_get()
>                                       mutex_lock(&entry->lock);
>                                       if (entry->shared_desc) {
>                                         kref_get(&entry->ref); // on 0!
>                                         shared_desc = entry->shared_desc;
>                                       }
>                                       mutex_unlock(&entry->lock);
>     gpio_shared_release()
>       mutex_lock(&entry->lock);
>       kfree(shared_desc);
>       entry->shared_desc = NULL;
>       mutex_unlock(&entry->lock);
>                                       // uses freed shared_desc
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: fix a race in shared desc release path
      https://git.kernel.org/brgl/c/53043b9e83cc7f4e30e70161b67ae93c4c9fdb87

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
