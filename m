Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502781;
	b=l9mzgkbRbwqsTPBh/hfSNir6w6hdpCdIHycGTD+CRWszPVk7SCxuk6ToK2A7KZkMylmC
	 fatPGdY4bOXYEsR2/RMyvNKM49Ro2LVlyrvafKotXwPI3rsY7yIcn/ZjBD8zKd53FUrjy
	 bWK/exUfKG2QcGV95u+xn2p4YHSFhPBPYaO01rS8B+sB+p3MofIB+KpcYb6iCPrS85BtV
	 VZnF0yXVNz0r69XuXyGod9KX74GNqpJBxCIWqiyVGQFxZb141FiREH0BVRMD+mbTBubYT
	 gcBMFKUqsZsAHZN+wRfViz89rf09cOinBxbavluWE/PeM5QSnRAatWIMNzUyF6sPvow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
	b=OaFHhwqByBOIZoiy8QGZGzTvlgLtUYOett/PfGLXyds7zrb2QoRgxxuWe+yPWQrBqJh+
	 jBSz178VNLDnZZyXC6DyXxDc8UrWMRPIqSeOmAeYpK67mztmXkjvJgjxFccv6ZBg+a6/y
	 3XMDt5LCYaCDs+hFRhFy1bgeakxqqQB0JJCNoJos3X19FsCW/gNt6b404By7HNGfdlKqs
	 J2EGyuFCHlPQOjhsHJ/Bs4GPF3gmwNQciZSURvaARS0NgNgQPw0GapTBYIi1Flo7CU5X7
	 59bs3B7+Tl2E0TYAsVI5/qxcRkkcaiualtGdznoLgnAu6Mrk1B5GV/9300x+PoBOGIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FhjmhN+i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8jBjv3J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F326606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F326606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FhjmhN+i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8jBjv3J
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9q8Y2845546
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=; b=FhjmhN+iB8MJmVBY
	xrTJdxO16ebB5m/+aYgPFjCujUMITQK4uZgY3YcE3TBdUaYi1KB/Y6PhGBIATqiJ
	e2TxVMhcmLP/xXcxee6joWZQTkOU/JhmOIZVl3blD+OUKPK15OW22ZdDoZJfiogy
	h2PTZrpNFgZSP6j5hrsBJUrvvEPT9FjXTY7HHCgC/jESNkdi66hecgdmkR9RJmCf
	9Wi0HI+UKkYcmAZdIyh1l3X0YOHFFwMIhy2FHMbMfXkisG6Ao3CRZfCvyod5SVAJ
	9Qj0HVhgPC83F9ggHURksP5EWx7zSJRMFKab0IgGQwAxXGF9832zuSbuXfwEXZjn
	uhIsIA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5namcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:26:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so225103241.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502779; x=1793107579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
        b=K8jBjv3JGzvAPZmH95EtLYtTUNS/ZTVY+AQG9E65pcD0S1w4VlWaTwzlAY/W7gdawI
         qkhWIXJViaFByjSRMDBWRuNoz01rvfsq8OLWXXHMKpl26aWuJEsU3wtF20xfpcouFBJ/
         M0p96ZLXi1W2FmHwbWY+hIceiOKmPCZPgXE3lIn7nlqF4DuKcLvHE9TXvXEte1T9ZVnP
         hGLhHiEJt8f1brpkHdYr8s8X0tUBwApiHnF0re877ucaZ0dafTk/BC5QUlQSfjorxvUj
         Nz6iN7DIOo+LnqM7SPW8NpvgwPcPszaVu8OXCkfMcgjGMARBbwJO76Y1nbpJMB+BPgRg
         xcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502779; x=1793107579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
        b=hxsViT4qGLCxr44DBBnJrQ7rhg7D9IszBQd64+YBzBDfFbVGtJynkFQejqVs9ZSy+2
         4q7rHjZXKNA/R+pcMQ/qLmxXmj5OmkV+PvevUOFsETDlZgJNYR6NXPumDHJee0xgbZt8
         UWyerNbL1REfMsGrkOKx2R6WiMHVeG6GsWG8u30xS/QzHzKTekiGHyIKO2sh6049rGnL
         MNzXbDnlbtpxEbt2TJdpQyPh+zv4jIr/GsMdit7H7UKM00XOwqFiO27YCjcsS5zdvJOr
         CaNYCtxh1y/U/Ruyceum9sixl5oSkx7RI1QaTf3Q+HhlPwG1IgvZ7bumfQ2rnvTZKSvb
         nn1A==
X-Forwarded-Encrypted: i=1; AKwUvBx2LdXAPJn9Jvqp3g+MuXcdSD1WIoyQvApECaQBEi2l1keLH+jdXjpLJHU6wCcm9MwAbJvcwyL2ofLD@vger.kernel.org
X-Gm-Message-State: AFq9FYIQD9+xIxwU2SORp3r7YXpWkZRiT9hqOhGnh4bEAsKuWwudIQC7
	ShVzFthKQqMnXlZAf8ezHtj1r9aOlQ4BO04usIMT3XO8hGINhQUbTTjbhU7DeF37Hhm0eIYTrcE
	F6d8IiIphUGaNe9zzgKkCK1SHctS7pQWMTeMbftn9cFR7IA9HYYvSqgMRPHwZ+Hkc
X-Gm-Gg: AYBFou28pGvqllE7UTivSPMUPjsycGJ4Lnu4jHXziy83U+58cBk5dKC3OS5wTblxZWz
	1iDFajyLUg7Ld0RdjMc5eH1G3WKBoXWjZWUbzSZQqD5XGpy2Y7anPVdIOd7nfyLrGTz4ej9wtkP
	bOlAfhvSceVBtRX0hFtzECUPlvQ8LUgKat5NPkhKICZECajDTKry2Xdz3rV0rz9ksgYomq9QjUP
	JCKgxpuKTIhQeP6kkyolYbjcHJpbAkvBZuWRoiWpUsMncT+lp1pcOBj/fehgLVpr9PwT8IK2vo/
	tIfugn3szF9CK2dRvpoGdZi5gv88e/tnD4itxagSWha5Wjtq8ZdaRJ0CahKRI1Gj2CzfA1z2aVB
	RDxvQqQ0nRhsQjsIjJsUvdcMGnpc=
X-Received: by 2002:a05:6102:955:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7cc3695dfe9mr2282377137.14.1792502779468;
        Tue, 20 Oct 2026 06:26:19 -0700 (PDT)
X-Received: by 2002:a05:6102:955:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7cc3695dfe9mr2282369137.14.1792502779040;
        Tue, 20 Oct 2026 06:26:19 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm67021575e9.3.2026.10.20.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:26:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
Date: Tue, 20 Oct 2026 15:26:16 +0200
Message-ID: <179250277086.33804.10505496122587377606.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
References: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-ORIG-GUID: KZs3gyF6qrcTl0iWvsiQ1ThuyqLFlOMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfXw6ABEzXSlb1Q
 HEcuo1a0DyKW8mv5iUhZj/SFZPLAFpuHfVKRJQMKL8r+OF98ELDGmS85O/h+yzKlZowM7De36A6
 F931gZWpsatL6RotimlzkjooLPm0ShbnN/Sz4lzKmraspOu9n7nYLWdYj1kXFpozIgQgYfP1gLx
 yE7f9SowgdR8aT3lRv57t8LB8dWlcaNZswVdbgveAQN+zQ3Neb97q3PFtRvAQYVWT5+gaeYdHd2
 ZCJHwjjif2NMgIY3kRV1DnR4HeDAnxdGjeXDhe9Ea1y/lZpAmFGimQ3upWupoPFUCPtyiEBDuks
 BclUmG/o8T4Vb2CIDJrF1+oO/aTYndVK3afuYhH6dvkKqaOpP6t2tVddkYIeFceoi66LSeSmF22
 DA3sumLcmK/XNmfncfny+14i7mGG/PlrqXzsI+PmfV6vpyySZKbzPiKG1JXM7TP7ymPIMG3y505
 g2psJCA7KIR72ZF3jxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX7RqBuBhcxnRj
 eux+7AZFtFGdK1OEO3ZeWzRWySMFGqdLNqmgHBxNck+ItUzqklD+sOAFQcSbcdRgBgdLTgB4d3X
 TSKavsn3kvr9nlRqK4gC/rlF5f1np7w=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad76bfc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_G_FQYvs2ls0BvL-ThMA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: KZs3gyF6qrcTl0iWvsiQ1ThuyqLFlOMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053


On Sun, 18 Oct 2026 21:40:42 +0530, Sahaj Chaudhari wrote:
> pca953x_irq_set_wake() updates wakeup_path before asking the parent
> IRQ controller to change its wake state. If irq_set_irq_wake() fails,
> the IRQ core rolls back its wake state but the driver's counter remains
> changed.
> 
> A failed enable can therefore leave the expander marked as part of the
> wakeup path when no child IRQ has successfully enabled wakeup. A failed
> disable can make the driver stop retaining power even though wakeup is
> still enabled. The suspend and resume paths use this counter to decide
> whether to disable or enable the regulator.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
      https://git.kernel.org/brgl/c/a38bf551726a21c9bcc001b02164f30378b64b64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
