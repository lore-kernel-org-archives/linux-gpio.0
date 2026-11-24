Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528760;
	b=ktffGSv5hJMEoXEkcUwlrMHTA0Ft6CqPvb9u8bKgVOJaDE6Ry8BtlA/pPCGHZ0bIJIMr
	 aPmndGOIODbz3p+VnZ6r8qhW42r0hd4AwEzRPtfc0F2wrtcIaAwzAK35i210gd6LbZ+cM
	 U7fjki3Y+zS4kt3BQNawkD9Lz04Z6JFjfsoYTWY3xjpCbS/y6EXRRjU9xxAlmFzqaLx9r
	 SvNGbtDteNmVPwwkOBSGz3R71BNun+64ZmFAyEMnZu0LRiY80S6MyaP2zt++4j1bUzdW1
	 M/o8D5VqjkIt3DGy7lUpW3LVCAcxMehu+gL27uK4XDTUtEzPhB2RMuhP4SHjtA06RaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
	b=Dvsk9BPestQxjVLI/OWHyANusc6UHxjTgrNSRmoCD6mF0gEWkj1t24SrxHhfebHe3OvY
	 iktune8tHSXhq+Bgt51feXnbxnxfPd4LzdQYa7jSjsc28ikFhEtlOB1ZC/RXDm9554u7r
	 5frGE2Nu6vRNVg8nArHOZ1iQbpvuWUlXCUYmMFZBy4i/gpJSaicjo7kT09eFGQ+TgTx/q
	 sGoiSsR/HK1Qgc3rzmIyNJG3BXh7+fu3jmjsfaaeIYjosfSY37mk7I8CK09GQhDbGDzES
	 XXJ1fw0AEzkCjXq11UdlrR4VM85xe4d0Rd9GxSLhaJY6kCHobWnbB/E5A1p9dDPP9vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F0606A334
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3F0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuniI1291664
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=; b=cjon4UcjWcOCiCM8
	gWnrwDsiwp8zzMGkWAJPa9keZO2UKCWvdPbBRjeXwrgILeg8A0E6yZL/f9eCqQJy
	O96ohgLQVhZoEIEGGSYendAY0kAs4E/AMMnW7bUQvgm6QHQwOBM5GYlpnMNBqIpb
	G0+KKhKO6HwZ9cJ6SstBm1mVACHgb7ITZaNm349eAUITvyDoOK2Vhts2i71NShzZ
	aTsFDdMyLx5KEmJUoQnOJeHpgXB5N7GQrcGeLfGns3+3ypy6i0l80fMK6zj/XH4v
	ZmAfEaXUVS7MnftLthxU7ZN2TGHLRlWLMZsQMYPU16dT6qFU53GTsRU5/hGoAumG
	Y+fjhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc4rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so805627985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795528757; x=1796133557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=IN7Q9iD+O4F/PJc2it92D9/IjlQdp6EwM5TEPIVGAQp/v8AEcn9kZyUR/VAhDLneHt
         pdzxCFGP/NAzkGdU1isqrDhHoOxMk2h8qpS78rlgoYO8IUehw5J2N+iaPuMU3eNwEWzI
         a8o/dWwAUN6BpOZOyDZ9PvKU4PUHMoWWAy2GSsX7k1bH3Atyi61hOxt7zbzqvV1hPNy+
         zOeTFRl9M/nygxps3bdprTPVsKW1OPP619EBYe/xe+2nwlmlibFlTVrVKjCqImiYtRxa
         1nG+ztXgG/QZ660Qq3uMBEz8998p76BroN1nAbKGxFgF7/D0rdWigxIMQieNNoE9l535
         ii6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528757; x=1796133557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=ehfLJp6+nSBCl4gEyRBoUiKlLnLoRAniqZo4ktdQhTu82pXZH5nYXEGGmP3cYu8gX4
         qeiOiyIlbg+HaXnJp8hoQVpJBzQp3kCjDyBpv2ssh51bI6VZcEr7uZCbLPkLnBGYgRNx
         hL++LHpafxRM8h2Vd2I3eHgAZZyHJeVpfzlLuE2l4FCMb9tg5qoinH2j2zEUbzAcs84O
         +8oWL4HWssXK6fIoBfq9/OudJe592uoS9xKwXw8Wh2dU878YxP0xtyzeB1g1n6hHdaUt
         vzf984DHHO/6Lb081UoWlPWdg7BCZviorclsjdJo4jzqglBFQL68IAD49psGcTc6yGYP
         yACw==
X-Forwarded-Encrypted: i=1; AL+hErGZRw4glZEPm0gQmoE1HCexwf8v6ssvadZB8JCeZwjFJbGcXuelYh98SlNtKvxkedYTNlrrRZyj3yjP@vger.kernel.org
X-Gm-Message-State: APuU4Z/2ifLLeTIRBdozOCE+wdzb16MzSQJLEfxmOMTh9ERegWn2Y3rI
	WMNp7aeBv+mpbeY26rGQgnGjywU/+JFCpBfgJm1UHSMVwgz0rQqhngW4DEFyp2Xmay1XK9pPitL
	5N/q5PME6zN8qI6yCUPZNHD1iceoILx85YQZrv3BAw6z0OsekPwlQdNSa64B2EB4R
X-Gm-Gg: AZFdTZekYOV8TSFXW5B0CxDYsCFBtoqadG/iaJ8lonAIO6WWala1ootUVngJjO25ELI
	x1BWt05mSjNQv4Bne+41bSClX+yymkg8I0o8JS8vomcWaduC1okc58+xjPRNU9OnJqEMfTvkd0m
	pN/MW0P5+UoKYYkUS7XP8sr7k6TA42VyfdXE3fG2cXFDaGXDB76Bs1XWKswQuDQUFZy9ceDrUzc
	l29/u9PbYnC1PRkN0MXQYjle89fLaU2hA5zjxJgmmdrvLk68OYpcw0SnyX6q+XSg0QMLD+DSbYR
	mwU9SWyoab7jfte4BF+m8i2fooBxZSm1GpjBRdmMCt3YAF1V1ASGP+V5tyCf3qTUNDJFI5kvS8Z
	FtAEpkIQjHxnkbYm0Y6aPhNEYFCjwTZTCeFPi665iH/t3F5uo0rYW6OzamMk9Jef/VMI8aZSf6O
	JDVbDS8EQjMNlmnfjib0uO7GvvHZpMrFEqE+uHHSFuz4Vx9yvUSmx6tvHUMr4ldg==
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739757085a.18.1795528757518;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739752885a.18.1795528757012;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28945865f8f.48.2026.11.24.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:59:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Kent Gibson <warthog618@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Date: Tue, 24 Nov 2026 14:59:13 +0100
Message-ID: <179552875131.26219.14927804757047791549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123085723.156933-1-arnd@kernel.org>
References: <20261123085723.156933-1-arnd@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX9zGNx9RafT0M
 qTu2Ud0gvaJjokhJ8BfJ4yxUYjxc+AjTGDJJ+kqtf53UC8w1Cnq4UPfUa6hSRGT0UR/IAQbktaW
 xCGNmwNX2xr36H+NYyLgpSIHgsBGCIc=
X-Proofpoint-ORIG-GUID: WwcbSEElApK3rbI4RogSe11P3OcjtVJR
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059836 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5VOqrEiZFYvkFkybF-sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX+thbnocCwb4b
 /eaqMn/6cZSLZDwd4MPunq/qN/rU9/SWDCJdXxOjspFAZ11sk4hFfxiOKDm48T2a8psAjMsG2sc
 UezwXl+vn9boQu85sh0VSDDmmPkqNeeBWm+ZcA92ZMXA8bxe2KkZRcrtLYpOyF/SuG/cadeDT3w
 FX1W8J+NkJsFShVYTgFy71b72A26TDT+pS0bqpoRKyGX5iEY+tnFYjqhDXHBUUYm4nIMSB7c/hR
 Z63oUaBoojtm+PFmGCYDLQNicEQg07Wu0WbGz4UPCt1BELXOhgb+dIsm5e36L+2pA+/O9ja+oKJ
 pJXtSSc1sxxECrurF/PvJ7H8ucnflrthcyR1rJA+dtuOezcH/MhiHQ/FfIbgyCosy7CCFaiw14L
 MyQkAYTt8xXJjvuYaiBcHooKCgT/RHXGM2Oit9jYw1r7RIxznlLT8IjHDYJE0IttvpGnIa2InMm
 UOY28QK+YQKBYhZ3N5g==
X-Proofpoint-GUID: WwcbSEElApK3rbI4RogSe11P3OcjtVJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240054


On Mon, 23 Nov 2026 09:57:21 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two patches are left from my cleanup series, finishing off the
> work to turn off CONFIG_GPIOLIB_LEGACY by default, and removing the
> include/linux/gpio.h header.
> 
> This was planned for 7.3 originally[1], but kept conflicting with
> ongoing cleanups for the broken rsk7203 board. I've skipped the
> oneline rsk change now, which will be fixed properly by Dmitry's
> patch [2].
> 
> [...]

Applied, thanks!

[1/2] gpiolib: turn off legacy interface by default
      https://git.kernel.org/brgl/c/b52fb554b36ba37f86a591d0d27dc45fc5628920

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
