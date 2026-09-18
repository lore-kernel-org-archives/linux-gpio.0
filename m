Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946302749DA
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718379; cv=none; b=eCH6c+svF7acGXKppW2elY6RAunaaGnwBd4GHpx7fywqSdciHm0dJBOdpqF/G7hWjqHEz5EK9q1WQPMBZSFIgnKqWu//acGHr8d/BcTcUTZn/j4fF3UPxPgWfrXWKQWLTvntvvpvSCE9dcTw/iuaHHDrozgscBqZKhrevGQcBz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718379; c=relaxed/simple;
	bh=TgzAnU/9GcL2OUaDzZzcoxSazgXpxCCn2FZR9xAtA0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdHQT1FOheYWi6E0QF3TccZC7Z0qWK29AWe+pLaT8vJcAANcE7NqvEUfkcMCpVyZI5nBChMiBNqxwbNzfxa6qn0qhh714x937vpGOZYqC7HE7v7K8o6PM7VvJwFd1ZykoJu+CBL7psMtpkND64/NnuFWXYJeHJRuSrUwQFaOC5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4Rz5zCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqXYZ/mf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4Rz5zCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqXYZ/mf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xwxB3254919
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 07:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=; b=I4Rz5zCXrC8Tkl75
	tMtl99QGUjyhWez+pRToyZDtV3LhRQ9bFVS0qHyopIuthhAySkiZwdx+YspS/Q24
	zLbELXcvPkJ+ewNLtLhVc4X7bJ0mpH20NgnzFtYoZQ6GgK1/RaddsyEoiKtOvtpo
	Mas/lgv6mXAN6/q/gUp7KlCcgdXwhMeo9x6OF4RknpaB9rxAE6A5lOCl5I6ljsxr
	kvu8bVKYxFYMUGBLhJeJeqqAk9MijR67ePqvrVkS7lYNnLzLwCwARGj0+q3RkH8N
	YaAgSrsf2PNjL3LdDH1s7+hn7r0mg2VmO/mmqaZEfkbP3+lh8DVerLWjhEKgN1U1
	mbk+sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5k3vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 07:59:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so75446585a.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 00:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718376; x=1790323176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=;
        b=YqXYZ/mf7GyK6rXNoLInyMXjlTn/cr0oi0iN95a32k0Ac1eg7MgAw23r5AnBjZ1Dbn
         6fY5wCbgH1IxZENX/Ddy8bocvNKkF/VOiSNK8PAvZWiCnMPoJrym0urtj6K3jDUxgDZc
         6VOTQgLozHZt+mtjde0+wCNqqB1YuZkDgscjaW2C6mnjuTogr18sjQLNkjBALTCz0r/+
         OdLaPvWsIcVTyYv/MGflOOAuyqfc0bNvY3LjyHG5Hi25uXuFst4m0etQ7XTpfFiYzcFc
         mQ7e2cUYaS5Aq3FMhg9khqeNRGDq8cbgIYXYUai132edi1fNT4ccZxSQfv46TaSVtO1F
         GBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718376; x=1790323176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=;
        b=hNwALJ1QrrSowCg+o3WlxwdfW+LB5l/jt8J/wNywGBcZPgP6JJ6DWaIseqKo0Vr5pL
         klmT+7y0tPZV7BYXSOuQ/ivsd0LyfoBqzmfkEvsVKcE6nJ/WCf+kCXDPABkiFhy89lcT
         MZL+HqgKOfFPxbyuBzZmXQO5GZ+VG7H5QJGm4G3gsqKxi7ffiD3rDIzxCGverzpjLV6d
         jAP+4jC4hUF/P5xOp3IzYIQvcvfRfw2WrafrTXqgGr6oM5ykwWTcrxbLLYwu42l/Wp88
         SN8HQW4TZXeBwkWmIJJVLuHCrAuTRcrtP+T4tqq94nIoy8DfTi7Z73pWZ+lcmzwF35At
         tMGg==
X-Forwarded-Encrypted: i=1; AKwUvBy9ghgeoduxHwSloz2pUkLciWprO1kwnqCYqoKbzl4oYPRVNQf8QoNuQv6QLS1VvainCLjsCl17ZZzT@vger.kernel.org
X-Gm-Message-State: AFuF++n1ka7IDIpN1iIG/uUWs5fouGFkC3VHD2ikgy57pSDLWap92oBr
	0SlkyGK9D6On61RHnFGAwLSCdqqjoxLtNSa8a1fLUEsUkwvnL3VRVoeDoKjgxY4/pxxK7NNIm7K
	NJ0EBisgY6QTNpAcRpzDpkGcqBNXS+IFUgXyN4sx8mVveGkDudLF05i+2pql22x/r
X-Gm-Gg: AYBFou1g/apiwrw66wXckdn2WaKpXFFLf6atnde7sVA5dw2ol6+6CjVX/ef2EgRfxZV
	Ehb/QGYmbpSvREvrawBGIbV8l+hLEW9/OUL/6zGNJ0iui5SNEF2uTuQ1EGreLiOmftOsPmDlZW9
	ib/INHQYeej+ShyYf+91YM9oFG/0no+oL1sq+tWukgI2yxX7tPUkGUkCEEAa9cy6J7amb6RGf74
	Q0ReqiPnpd6GJiSBTgBOLHwFocix/N917iW9INr3cLzj4cWZzUvcmoYTvC5buHCY6Ie0+gsVxTm
	kviFMRi3Ah26yXxlb0gEWAz5yr41RmKD95sW1pjgOWcPnNVaRTUQoYNCnxaiBOYMdi9DK+xin1D
	EOtSPVs9YU/+kLY+t7VNL4HxBBEQ6rFLk3A/EVjBZIQcZFCb/RD/8ReAtVuEw
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr214413585a.21.1789718376427;
        Fri, 18 Sep 2026 00:59:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr214411785a.21.1789718376036;
        Fri, 18 Sep 2026 00:59:36 -0700 (PDT)
Received: from brgl-qcom.local (185.pool62-37-34.static.orange.es. [62.37.34.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5de3sm2358157f8f.1.2026.09.18.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:59:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Frank Wunderlich <linux@fw-web.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        frank.wunderlich@linux.dev
Subject: Re: [PATCH v2] gpiolib: use of_node_name if line-name is missing
Date: Fri, 18 Sep 2026 09:59:32 +0200
Message-ID: <178971836797.4310.16876510471798115989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917153712.134367-1-linux@fw-web.de>
References: <20260917153712.134367-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX1bkKrVOymXQ5
 CSi51u8FAw/9I7PF/Dsi8wXJEiQUQ15wTXzsjAldhq7wC4xv1C/LkliXw5BpzJUCLvLIuxypm6q
 OGvXLRraTTNzOIoKX9pfBIg5/w66NVOJ7F8dquCgisFulOJ/rABCz9pr/YVbL/253+aYTSbv4V+
 +X/X0GE4wau0l4wvQ14f+gAlRfP12zGAQ3fm+PhyZxC4+fY1pJD+go3rzs04pKzV/MZ5cmL/yUb
 6TbL9p4xuj9IpTF0v8/ZOefSGxibNf1T0v+q3UmVL+rVFtLzTMSfwl9sxdS1v6ejhb9ouXj27Bp
 BBIThQ/2AMykSsuZnjunGQtJcgZosxG4l4+tPOF1c6hgBblcPNM8gZOuhdsWc/GE4PsCYCsIx/r
 6M+ToSNE8FG9KSbM1qNYuGYF+fIvgsPlD/Ur5Fb2GHiByw62f8/HpEBNJKwRYjS5Qj19U5FXA9F
 7YqmfmXGK3GHVMmHV9A==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aacef69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gMXnIfcteCbZVvXnpe26Ng==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=31KojLRLK06XSZVqnngA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lF1bbwAXufc-RyguL5dLYqQoeLfeSBil
X-Proofpoint-GUID: lF1bbwAXufc-RyguL5dLYqQoeLfeSBil
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX1muS6sFPB9ZD
 EyrU600RRPqcoCbLWZTYzFZzklPzP/Kum6CPJvc30VvOScbzJT7QpFGIG608QAMhCnaEvo/u/kQ
 fpI+6+stXz0K2vi4PmMdhmy3YL/GqQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180109


On Thu, 17 Sep 2026 17:37:11 +0200, Frank Wunderlich wrote:
> Until v7.0, GPIO hogs inherited the DT node name when no line-name
> property was specified. This was implemented as a fallback in
> of_parse_own_gpio().
> 
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
> into the GPIO core and removed this fallback.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: use of_node_name if line-name is missing
      https://git.kernel.org/brgl/c/d54a489c8c4b627775445d54a6cbd32f209bda8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
