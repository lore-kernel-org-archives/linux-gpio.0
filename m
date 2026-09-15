Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F343B6D3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510896; cv=pass; b=NnN934TGQtAm+gxAX2XGgNxeKwUQF8DfDoKid4D7h+yTo3iqkwmau4csSG6zZrkruN6JCIE7RfgOoUqwNX1//DCdb1DXb8t/hg9gkWee3PIZBan5c+kGfs0a601PSDM+lORJHEr4nkyKwFxynIdJjAaE7GKdHY8V9DZ9yHWvO/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510896; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZWNvWeqATms0ktY3JyEQJji2eg/9+f+J0W2KtekoN0JmJwNT74Fv8IzMAhep00FVm9jSIWxbj4kZUNjLOAsrPXkaAI1cQyNGjY8r0b5D+OHUtcwz96BtGC8IGONPSF2vTlRiowykvZ9l3/lZFXFS+JleMl1/lXB6tQhUIdTHK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB07AtjI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB07AtjI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ558721620
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9s4m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46509ab0149so6391317fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=itOVmNWEJ0hjTdZac0B05TBwsCgr3EUVWXhCb25GAMAxpWJNB/Y/sOE7YEx0Egk+ZM
         Zz6jUYJcQ8LgDvM9ia+OW/oBcGakAnTHfXWdCQF3Z56kEQ0GhqHik/7CfJ86aI5gj/0J
         FydrRvGxny/vQXrh0VM8PO3m9R4h3g3JusgwXhtu2FZUcaIpTBCP/IwUkY2m2GzxqW85
         ByYpyQoiWz/GtaxT8UU2GMKVHz5mqyJYxHwDSlS95uQQJP+hO9Bc+eKWR7TXydH6PgKN
         iIlV5PrsDjTvDx2xhhcTMidfp1e9yiJXtebuWe4q8LezPN31ZARdyRH6GmcO0mkPkuHI
         ufrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=7hmm4oZ6pEEfj3A7xvUKTJgkzd5b89drarP5/tHbNC0=;
        b=AiN0xXhpTh7d9eEV0Lz2JIDnnHhmz1IAahRLoGeL3Gvx5Zu+qVfr5ztm03LZFN3AUA
         eVxjwSExdWj/gesh6hZInxlvGH1WKpinS0kFh0X+uOyyYhZfWWxivpR3kWO7FDcFBoWJ
         6CphNoOQ527HRmrwN6u/BY+FGVjY1pWVe6OGx3YmEEnR+CnptSvKKwvA/BfDmG5aKhgn
         ghGpbA5oJgn3fq5YyLZxHBf3dEsGbD4jYW28SbHkF8/Kn3zdUDYUCS/TDPvVUA0+bjWM
         zHXkZhLfiI/mdSxcHMFaI8NDc1uDvU8OParzdjya1EUXWGlA/PJ6j44N6o9gLTojC5fE
         LOZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=aB07AtjIKjPYRGcvBSuVUhbZlxd1+55zy/NhIuvnz19m7qssQTpE/4jhghs82a98Dx
         rtzGuCLITyYJpv6qqsfwRyWf2V/rvp/BavfnHKk+3jeYdHSZJCYDfk5x4efzm884vIfW
         UjGKSA8ySqC+bc1butY/HkkuCwEw+HH62Uipjk8j8bjqvTXRubAdUvP+c5BJvALTKQeE
         2MFV1Wjr7h5QJcQaotkuVTv077nzlClUSJUJjEEq6X2ukv02bdE+qejZx/+uCM7gRcPt
         xEQKVpHKyQ6abdYF/Q1vdcAj2ZFa315JGdv0g44dh8zUZEwY87qYbRStthdyfxwDukm3
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=Hbctme2GVIH0OwrHsG09MEmeAeNxV2iYsX17fNR7WOK95afTR7sgfM5RlBslJPX1gm
         2VFOj2mFkng0vmMM0cr5SvRRAvWGj8wzPK4noU1QX7umZl/EUy4Ebgix9p+F3k2poMsI
         o5i5C3tbt6jGJN7lJLSwD7zDTq6rZg7hnmTxOBAvrXJZqjPFs+nBdFc7ZmrRBFmlhaHg
         qOhJ6zbkTqLknyJWHbnojGp+vmXONfVvuIHdtppwRX2cxAR78K8CNjQNzwvPTRrSd9Pj
         eOFi8vWW62uJJZlhYZRmTHY4Env/uvY0UBJAX9osetUbSbJUlVgR/2ntvsLjTZLLFXXo
         0D/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhL7fFdyRhzO8+vlMBrZxi0gVXGUnC7L4/7Dvc40ObJ+hWTEqTw+xhy5YtQsWuph1rZJ7Yq5JIEgA9@vger.kernel.org
X-Gm-Message-State: AFuF++myKEobdpSXpQ7XPO0me/JpdZQmxyy0x3tGLOmlQfx18i58Nm9b
	9rIGQIYg9CJ3ajtVvy1Y/e/muJr5EWTWOZt0XU1nFhzkbRi1ylnJj827VbrzSocZq2OoiYQzKz9
	UHcFM4PuhB6U9Y6TD+u0TFUuTF2ony1Nv4PSeKH496ThFf5u+fYii0UZJeii4301zvHyOmlRIEu
	7VyVR5LtRe3pDzLDBrNpwMURnrHb2pPIPaUwK+hms=
X-Gm-Gg: AYBFou2bVMZCpBEwKC2ZyJJw/ltk1brzE+vnX1IKqKmCKheBsaN/YiMu9i5xs4fM4y6
	YLtCBtxDHNpptW+grAruTn21Kid+/3ff36FO4uBAiIcQXMNlcIf//bfRR3YjdUcrxceI8nAKULL
	guk7p788z/rlJcKyRe6Xdn0Om+JFj7CvpVJ2SGRRCMF6iGE1vycXUm2GyB
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189754fac.2.1789510890844;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: migAEhjB3eO1T3lGAEHFCtQzggw9_Pi9
X-Proofpoint-GUID: migAEhjB3eO1T3lGAEHFCtQzggw9_Pi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfXybhawRUI0YH7
 C28JMfRkGbZhoSWka2UeFTYQZMlOec1+7XyoxMoacSupqLqYQknBZrzyXnbAVFdsm4TJkBVsoSw
 MeHD35nHCqkfvLrvnALW0iux/dLJD6twCn8lg6ej3Dt66HjXfSSyuOk1OwcGOLfhFLYihoCD8Ol
 MhztoO15p3h2Dr2fvzOHWU4P6U6nr7/Mn9y3S0M97fwml9ebh3jJ4SWbYiNOebswI3fG4v9Bkw1
 fZg+Pg3uZ1SpDzGgVMWbXuKjqjwAbwIurcwoDCLf35GeMnWt5+nz2bUc9hqsMaYMX6IPX0sGN4p
 EBGBG3G+w2XvRVI4Tt3xPwl0L7K41DpbnFcEkdrlzPoADqnX/NhZ7gjkQ/dIuPDnpfrJ3vrIzcX
 wnHIiOIhCLz1EOONuGON1eSM1B8PB6hNKAWw9bin8BZzOPczgW2ObFztq15cLJoWIRH+L7jfNj3
 +1zHEIoQispmuyjdLfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX89FPQiioSQNp
 mCRsZpwrmLl/tt1C/aQI7kwOV1XV9ZLQoDI0mowi08iCoXcplJrVWT+Cei3ng5VFF96KRZujz2z
 KWkE1s4UagvGrq+rg6FODgEGERggaA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
