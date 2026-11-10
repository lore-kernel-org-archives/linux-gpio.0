Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302409;
	b=zOQumQ10OtF/JEwp4ukhC7ZaK4IEeUl3IxSnCx/lUYYwJEXJ3Pn92NJ3yhN0QKPLVC5e
	 EnSCAYGQoTVyeDhxK09zalJivPYBb3rHix3qlyiD2hO2WCHjpiIsgLA2ey4yYteRF2FH8
	 E8pS1hvU806NNg+veifQeqMZcXy6bpu68rwL+F1PrAtiuqKPG2lMXGIzpwKygz+vdC2Oa
	 vjd9Q/krrPJr3K2rANn0L6w9Hxf90qKK3QqigLcqNj0o+/pPNhwTHaHokygrZcuo6V80L
	 uGRPEM6/PObpGAjXitG4wDzaulL6XYy79fu1SWlSeQP5nyE0/Var4o1Sk4lRg9qA52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
	b=33oS3RPFLyNZfOvjYhePdEqa3q/YWru6EF6DJ+99g3zKWe0/rce8m8rnZO7gcLcWCtm1
	 1YWTsQiDfiQSeLsV2H5HkTba+F1uwgrMDb90EbTcJ4WIGAsdKElF8+ikp27H7yiMl4d85
	 H9N9ZTZ9PNi1ot9wurh9nbfT03EaejKuFWu7QNOP9Q9Jv+mMOM2V72HMV6s5kZVwuR0R9
	 Rc77teYGGdXj/cK82fUBoEJuU6Qv8VDGYi71u5yI8iZPV7WLAfXnnFMW0sFhyJE9xC/Gl
	 CMDPSzkJyQ+C/Xij947V2/cJtCwsQMz9ekG6R5SyNm0zRWRFo64widTJfV7zKupY7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFivqpVf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNTLlnuo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD460A3816
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADD460A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFivqpVf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNTLlnuo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDX03392609
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=; b=dFivqpVf/nwF9r33
	JheznplMIhov4kqAzKCUHPewlN98uV+AJ26XJXZjH4WkeuAygv7cEpS5y4i67Gdk
	S+rRkSI7+px6qDQUfsq5AVwLGI5VvExErqUdKqd5j5a6Ms8tepxcwd5PNx9Ja4cZ
	Rsow1S9msWQq8fQMmtHzM03GANgclhDrK6qARpKixDYIs6uW4PtgvgIJhOgLCvX0
	sU+speKRrNwMMVp1qAK9jcL08rm3EtQrK5/UybN/Dk4i7OuGn9cvWMVjJ4inoHtj
	P1BUvuI6sDo31ffKUFnEgIuHiA7I6r1mhNIunyvtIL58eoveEGcjx3zCNubpJkoa
	dxyghA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg2s8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so384505885a.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302407; x=1794907207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
        b=TNTLlnuo39/cRhCnr0X/J/bsYwdKq9vGzq2xuUHwzKtpJa1pre3/+ZIzxpAhzDAnPK
         IxQ/KCTq9eBwQGqvmoRGNqApeGT414oL0CXl0YH8cH3g2Ilr827JTytc1y4eHTqvVHtO
         AT5cCSQv0v01CtwYCR5KfTPblhbH2kDDUxVuoy4985SloQvV9T9UviYJ42HkuzKzZUzN
         e4YTvjNxnXVHguG5Unlwbza0Qf+c8Enq5MNMygAwK42SqH3Bj8oApAkVBSWHA95YBRy5
         bATvyLpcJUCnC/Tjo2REgAdb80bsUL1QcKalLravl1nKTL3h3o/A6rP42CjjacfrZy+s
         01eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302407; x=1794907207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
        b=k4Ej48BIkwzPxKCrYPlm3PmhkQDs2d/W8bxOdg4x8aWomPWKT59pCHRKV6tFTAnDep
         5L+I74gQ1uU1a3wPCqYO6M2kUVbbRmj6InUz9Mi6nO7FozEOQ6rgPK2OMnOTSLp1D8o8
         pUXKFwW6b3rNDHX49v/AbAwCbm9JkBZS5fYU9b6bwhY+a2BZe7PthQwejl5WFwdJvWjc
         cyYyyFCJz4I61lCjPgPXeMjABR0oePJAUutdkxsNafRlaVH0nbsug141uA5XJsZFo4P6
         9Jh2mHMSGl2UhxQlsQ/CkY3XHZoLoX8qROJPNJBLQA8Aw2w3GOPBoJwLxukM2GBTly/A
         zVlA==
X-Gm-Message-State: APuU4Z+nhpWwesf+rWp20G/vNR6+6LhEg8nutpQb4/wDB0FsjuOQ7ISO
	v1GpfRywbnc7c0DDB9ZU1/POvHQwdMEo2dMAaf4nnlpzwCrwQLjshxc7DBrbHElvH92X4Tc2r3X
	No1RLxpCqUg3o/8KuW3xOg2yFfMG6RmLZWOwb+e256kcPN0XD05+Fs3E2PL0+qbum
X-Gm-Gg: AYBFou0ArtANdXnSgyjYQhX61NP9LEUmd/8uh6Siu1MVpTqi9ueYM3T62b1GEcy8ovW
	cLBZruqMow4eQWQncoAIM2rfir28NpDvLF5xxEiwHgZzeVK+6SiGJnJqs16TzkLzoE+RVNCJmqR
	DQXJpbGyjHqUkCUY3tSM8ROGg5BfeRUw5NmhrhYFLYRdf4TzlbsPGcDcl7RiBb16LAl+qcEviOI
	RQ47u/l2/I/e7cB1/4liRZsDLJ0FctuYrpEM/m6fSq99/OcCSLG2eENhEWkLIAebvIwbIW/pa4t
	o/6cbWYWCWIyWtJp9BFzmxFSyc+3uQNAIpqLbi2vbeeB6lhtX9BPe6pNB6VgjwCKbV70Rk01cHL
	Di/8joMJRzgIuBh+oNwb6JCWah0fmak3ZRV2989pPsw+p/RbJDo9LbQjmLGmHQ/dFi2O7jyJyct
	O+s39jM9wSrv7oGlYGY8Lz2ViEopWVO+NZz9Rdmgv3hHedvC45gUoPoB2uC2vFVw==
X-Received: by 2002:a05:620a:2988:b0:93e:bcbf:88 with SMTP id af79cd13be357-9479f1cce74mr339173385a.4.1794302406643;
        Tue, 10 Nov 2026 01:20:06 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:93e:bcbf:88 with SMTP id af79cd13be357-9479f1cce74mr339170585a.4.1794302406191;
        Tue, 10 Nov 2026 01:20:06 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm47266795e9.1.2026.11.10.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:20:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Rosen Penev <rosenp@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
Date: Tue, 10 Nov 2026 10:20:03 +0100
Message-ID: <179430240150.6721.16840326534172400556.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-gpio-mvebu-sleeping-while-atomic-v2-1-41f070421e70@oss.qualcomm.com>
References: <20261109-gpio-mvebu-sleeping-while-atomic-v2-1-41f070421e70@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX0LDCAG5XDVRd
 lmSLLXpDHp1tXybhXMBEeefH90oxK/Xt1IcSF1uFszGKdKETk+4LzaIYR9Y9K2ue0e3W6Zo7rTq
 Kfzs4Et0/4kp6efdo/z1JAD+IJCgv0fPsntozVLOAPrNzxGTl8C3G2AXuv7648dsP560WneHR8z
 FvSXRjOLhTUtXapUnnBIOm4jFJiQMs0b0spPJAnIkoC7VsxPcfhd3xniJD8/MHCbpYsEm6y1sy3
 DJx53yuRVMOlTalfti/eIBsLD6UKWCq9etgDujBTzPpnFqzt8H1Q5gjF4cEJ8sSGn/u4uP4W8l0
 dQUcBO+XeT2Dk2FX+eO2aXrgc1rdHBJnpuiC0Jk5/E7e16ByTHiFmSpIIhrvNPapcRTai7gIFpq
 d0D9mgxKpeN2Iwv0snQsL65xxFD4ASb9IrUb+EpqIEhRWKNruAmogWWGh32AHemKRwpWyyTYJTT
 Ys5monuzXigicow9XeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX7h6UBENf913A
 q54qeYTatCEEzZeRt2bdJoszs99U0CQhHtd2itHiiIASrs0js3NCCiCdUMNstgZRwOjxIE9DQbW
 yJ+TApgDa4G7fWb6a2VP5IqNbwT2U+8=
X-Proofpoint-GUID: BnYJDzxQGzWsR2zbz5fO49p8ukPQdhCd
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2e1c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v8OVC4ajcfB9Cz4e_FwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BnYJDzxQGzWsR2zbz5fO49p8ukPQdhCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100037


On Mon, 09 Nov 2026 11:34:36 +0100, Bartosz Golaszewski wrote:
> mvebu_gpio_write_level_mask() is called with a raw spinlock taken but
> the underlying regmap uses a standard spinlock which can sleep on
> RT_PREEMPT kernels. Add the .use_raw_spinlock attribute to the
> appropriate regmap config.
> 
> 

Applied, thanks!

[1/1] gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
      https://git.kernel.org/brgl/c/42269cdb3d3b46ba6e80f31d0e00d0bdcff1d8d4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
