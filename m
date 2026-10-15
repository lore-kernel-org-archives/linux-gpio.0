Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832B528436
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066893; cv=none; b=QfA43BbkS18OH7PzzBqbd75I+L1Elg0Z0640WzM3ZL5M6/ogdfbx58UqDFjXXXqPox0+olLtqsBadzaFJwWxxTnNudvwIse3lsvo7agJ8QdJOTiaRkziHaeaH1rKr/LLuUNjPXut4JS9PVLfCEktZKAGEV6TXJUonJ7zirxubIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066893; c=relaxed/simple;
	bh=Wze7BopAd+EmWC1Uc0aVJpdVDI8Ue7K/O1WBlJdyYv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3sxgmU9izbQ1t8LYqaxTq4otyj6OJZ8xcK9NfInplca7yiHb2+oDsrUe6uqsrShLPuzKXAA/tPcCdEXR72L9KzXrLo5LF1JPUwpmc2KY9WttrmrrwuOXy4YzLLRqDpDzeDNkmMioMHiEnlhbqCWtu8GVM8H/ColvGJy30mFIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUKVqd1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivxNDHy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUKVqd1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivxNDHy8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPhAW4100240
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=; b=cUKVqd1Xe51I2+l/
	JkxqpjvowwnZ0Mh7V2dXR43lKe5YBQXPIpP7MuaJ7vlfpNaMoRUPuwv9+s8Wwmz/
	noLlSZcdHmLvd2qOuFzKk+KEsXqL037ylSYh5n66qeqlpPWxbEP9491ZgVT9JmJE
	YUtvDB8R376h6+kFQeiBCy8fnlULXFrMY7EpuPsqn8CPRq0prAqRiWmsjLxfzoii
	IM6piZSFpNPQMX7bP4jlqKYSDxa4+AOFnF8Jz8KpbZF6MtPm0jljtYWMD3TR3woZ
	OmT70xh2jtCszoWZTio4t2lJM1g2BV23SC3rCdNYJfUJN9NLQ0dCVYHx94wZqcV/
	JytFzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8d5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:21:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so1000454685a.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066885; x=1792671685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=ivxNDHy8mLpk7PdgfKLW1ixgCa7FGMVuJMVoNq2hEWZF3im6eGZvdkxMnPBr+fkcyk
         5p2szLoy2+x2I+bG58RQamvFkCbwMpPChAPgkIqo/UXk4Bncd3EMEWPdbm8M8PbRf2xx
         tttF+T6iX8zllR/CwWWhzoixi+q/X+IbzRSoXFNfCi+2jwsrRO9H8tONgkbusenjq/kc
         D6FmWH6wIprZpOJA02dDtYGyNaRDwyGmh4aOT8YGtOOzkqH7tsL+IUUMHBwyIJcLd5K+
         U8svrElaT205ziy4IQQJ0lxVWJs+KLhms7J16qocig0cPeF6wwAfJhkMT8RPs2xGC/5n
         DYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066885; x=1792671685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=o0LFJWAALWMJw6j0ItUETv8PdDqDXaUPGLgQLBJtULroz0EG7E1J4JWyLDI+lUPQan
         6rviol8Lbhd4Auf1IUS/MeDfSu1RcJM3okLqGyOEWTqk4Q4l6ZtiJZttwvBnnXh4fesL
         UI175zm5hhmluPXxkzeRP7vSS1G7Xar36Ao8TtiWJ/Tdn8JpUFnNQnNg9h0ku66Noepj
         ECR4aqGXXV9v+Y2SCbfZRUgB61MmC1F9I/eSojhK4XuQSFXmhNPwTNkfTU5t19LzFr+g
         2nOrNSs0PaslocKGjW6GopqlMtdPIV6iTXzlkH5W6L0hDVbnkRWxFa2RC+m/qWEWFpvW
         aBdA==
X-Forwarded-Encrypted: i=1; AKwUvBwP/GY2QnDJrGWL3OOv5MZwp4CIQH6b5389oVBA3cGvs92hdSEx1t4lPVRSoiihhqUyY3DE1iMfEJoV@vger.kernel.org
X-Gm-Message-State: AFq9FYIzRxAJh4QbKa66+yyhlcmyygwR4YvVajNEZ8fiDqQcxfCHTNUa
	eT1Jr1ELJD3uNvWnMbFjIhbBkwSc2Z4BJGwnnUjSLmfjhETdiwgYsdSVihuOKmT4JsbV1z6PVB+
	jSXbk983MnazqeeaaZINHRObQXg0mo2MgaCVs+x/NBoHeYFGXhjt2Dt0pbF4rzRr4
X-Gm-Gg: AYBFou1QH1KIN+ZKi5nzsqqR0Emlecd6IiRMNP04UdO/cH/MywlfMjzQFR3u2KMpLqv
	G5po3wM20u6r78qaW1Xv3Uaw6eniBMWTVW7fKHEOJcmZ5JUZ8EATzkkqBTWIOwCQQ9z0EPfvkwo
	q9sC6hLv3M10I3OMYXmN8VFiqXzhqq4p3qG0qwianJFI8UBU16zsp7cWlkNIErwSNeUE1UoS98v
	MRAO/H1Pga3erdT5uNSsiqF+3z2zYOCCUQik3RwZz33lPBztq2UjbTeFeCqN+SxTa4Aj+LIfQtI
	aGNGF/ceCjW5lidrjH9qCbGnfgk8Hyp2r7LRGv329EWHWC6M889LFF+ZMsUleeudAWj8y7CYR1S
	dcJ3xyqXDRoNm0BcfhTacmsROP4g=
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887411385a.74.1792066885287;
        Thu, 15 Oct 2026 05:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887406885a.74.1792066884748;
        Thu, 15 Oct 2026 05:21:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm18551537f8f.50.2026.10.15.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:21:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
Date: Thu, 15 Oct 2026 14:21:21 +0200
Message-ID: <179206687877.10309.9401675786609225009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfXzXNFPbdxKdZR
 hg8C5NxCA9xhyvu8k0NVTM1OHZSXrDVdFh2cW7GhzO0ZHm6QFLG6K6kjf8/HfUhVYx6ibSl1v5F
 Rmc3hz1DV0srrDJODd9tP+2spAfNbC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX1pRWSoYwOlW6
 P7WP7XWcpg/PuFqxSJ1XBihrB2qowOmU2O1lLKNlTdHdp6rWf1deP/GuiMaK4fzWp7xKNdiwMqo
 EA/3MMtlpQdedgcFZQKIt1agSQ5D3Wq9X+uH2aRcGIu005K3LeRe/oIaegKjgRX3ehKgqXQxw6E
 RTEFR5/lf9GUUhQq533qmbWz3HO4BtSvKweh+zPpHkkY5Z/HG7Bt7vQWJzbUuzUwSUmn5D1h8Sp
 PFAynp48GSQWLkjGHmDkvBMT4c+vrFHmbWjKPV9BpqHgPnzqwDfBIoeiGEEd7EMeoMhLojjmLw3
 crl4EE/URkFwcH5CL6g3f/liTSZDFeYbVdZNY7dx361z3yR8m1cU0OulBJXFb1zMx+6bdu+T0Uj
 Y6I7ir+bAVHp69fngmWFG2OHl+9itqmhbVX20z5IxxaPekS6e/XlT65AFXhcl0uGzOrwwHMBtK9
 vHoOlw3POXcpCb/TxKQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0c54b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FbT2nVsXUnx1RHKrfWgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 21vZfEUFy1xYogscZAjFU1ap9zghCAXy
X-Proofpoint-ORIG-GUID: 21vZfEUFy1xYogscZAjFU1ap9zghCAXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049


On Tue, 13 Oct 2026 14:01:08 +0800, Peng Fan (OSS) wrote:
> This is a subset focusing on bug fixes, that separated from thread [1]
> 
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interrupt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
> 
> [...]

Applied, thanks!

[1/4] gpio: mxc: fix race between chained IRQ handler install and probe completion
      https://git.kernel.org/brgl/c/38d44f78f041ffe60c8e2443b99434a199e7541d
[2/4] gpio: mxc: fix both_edges bit operations
      https://git.kernel.org/brgl/c/b7719c575dec69146f6d537fd616b27083c0cf45
[3/4] gpio: mxc: fix wakeup_pads bit operations
      https://git.kernel.org/brgl/c/170aeff46fb54f41545c85a72aec525aebc79d44
[4/4] gpio: mxc: fix race between gpiochip registration and IRQ domain setup
      https://git.kernel.org/brgl/c/205cccd06e545694754e1bf8d626ea96e742cd8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
