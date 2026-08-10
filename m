Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A52383326
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359024; cv=none; b=Z45CHXZVXk89tOnJ3bGKbUqf/4I2snRwe+bk011dBjVZqCcBT56dOA6XjPeTo6YT8Wfwn9HjqgGPdrzBDFCr4ONmMdTK6LhQHlFOB1If9s4BBmCMLxWpPslljcHmeYEu1hLcIbVCRUE9zjruodlJSJc5YlN3eNO6nuGYNYSStMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359024; c=relaxed/simple;
	bh=9DsLhoX5piKLeEPQzHEHiYwVMvOQZWoiM1+ApiauIAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2B0E5F3pX2BqDDULRXtOQ91Ca77kFnjvy5T1mH1AH51cYGYlryWEBLtWZyB0KSJYspbY237/moTsHlqbczxZ0Dxq3e/Dle34TPrlb60d5gDCsxOIjhyoX55fEijd0dB3wtj3Pn5GoVSuRMCOiLol9NTlB8g5qerJigZSG6OR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asIBoR92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNy+/duD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asIBoR92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNy+/duD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA08rS009863
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8a0yfE9Wc8uhZgvTWk0rgNE6Xq20QqYy6gQOfy61hY=; b=asIBoR923M46oTKp
	5SwOLOd2grxMAho76o2f09ZkEdKYsYJASDRfsI3AL3RYvzqnDMbzddmI8at0kWLg
	ls0PQ0s6oUvf8z2h9CDMmbJDVqX/xKE2XXV4wHxoBSf8PRK6Bru74LMr6LEzNii+
	VhLKmsj+C+wx5mlz/ia8lkz1/iD0/jSBycTHRjcZOu/BtFqoTOzlmrsZIV9s8vTd
	/e88RUoTGTavUr91WceSw+Ehp2gd/iz+9Zsl58aq6daWqMRivLQr4VGEuD/jIsVU
	V1cq0ByIzZLASuFkKBS+KIVlHWJs+mZE1T80MsQblYtnjyiTtuoumLsJItwcO2SY
	hHjwPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycger5vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:50:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so16939081cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786359021; x=1786963821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8a0yfE9Wc8uhZgvTWk0rgNE6Xq20QqYy6gQOfy61hY=;
        b=UNy+/duDB8kFknQ41zol8ReSNHxLXaMViKuHm1i79Hdipgt3Dij0wRTPIG/sChR6Kn
         S/V0BCb/T2MsWB3+t0YmYABueyG5zxEZ0dXJVlcuNZ1PqfvIMyqkxVdEOrPvD/5CPx+X
         kwpkJ4Jq094WHMwfUJArBh8ab81GgnRZZB1OXniUyA0wmnZQcdldWdjP/s04TceVhZBM
         jFFMziUgqhSHYG7d0MlqMFjYEp4LLIgdefgOScfAz2lmwocTmkYQC0lkdwEr61fJ7LBm
         zaeFhNHm7AzY8mjO3eG0ckxPQMk9ixMhM3sceCvU/+Z7vd3Fvqo/c7c0HnKzklzdzu/f
         e8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359021; x=1786963821;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8a0yfE9Wc8uhZgvTWk0rgNE6Xq20QqYy6gQOfy61hY=;
        b=JFcxhIXPGEK5e+SLPV6c+4k2RFr0iTobNkEptiOKSFl/eAll7TiNkFzdqz2eHIyCZH
         81rj0zBCVUrzsDbKNztqdvb0sVDzGKr3fu8cGGftOAvtFxTE2Bbm8ulsyrnOVox/sL/9
         rcjI/G6V4oE5k+8DFHNgVS62angvtZwxWWqcWHndrepqTMvmLOMFmvYViO2nfnUDbvsi
         BOonxIAdYZBNnc1jd6eTa7SF6xDAVqyyJ1ZnHgDK+qsTFpVb5xbXEuvAHDMaNzDA6vzZ
         ksqpI8w/JWMG76kb7jvgTe1wRdmyBjXdC1Dc4l6xyS+xov7HBC01aT2tK858z4gwYEiX
         NJcA==
X-Forwarded-Encrypted: i=1; AHgh+RrzFB7CErBcYPADDIBl5Bm85l4Z6KWXkVFdhcY4yIeQ/hJwO9dnszTtqog6eiVgb5z854qVf72i/RBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZO3FgrvWeacFITJ3tk7Qbv4xDJyNzts7IRME1GYbQ0+8965I8
	ScpWAyjHi5OzzUdAsE7f7wxx0hWGuzygQ5JGAtJXBO+gXFi26UGCFa8+44Qi2C8Tpu/YEqAlsqx
	yUH+d2uZ8XeRN/zMpqwnTANH624nPTq2RObQjfSlfNQStf7sVnyHroxSPX9eAaG2L
X-Gm-Gg: AR+sD13SW5jEhJnfpPNsm9LJgs9R3HThguLoZtbB+oUdHbn4lWg+GspCh4xfEGXwXIv
	+jihCZ4F3+qLf16U/ZO7bVtTk1/HZhjv7gJH09ItJb/0nXOGgJk4Thvu/SrrQihUyPkTpaDV+q1
	nE/8bceUJySy9jAFe7rzSXaWrj1QR3jgX33TjTbHaHICQ51RdGxxAgw3FCXPF55NqRGYrrJUsjJ
	dM6xhqyB/37kr10KECvrp5C2FycF3HmJM+Ka+bSy36FXghS2YWamcblwjV5K8lmMcHiuWyM+++/
	VI8XJzwA+YRjnReZJr3IF+NDXn0WrOU7p3ZUd3HlTXNvp/E9ImA09truS6smeb8CwTr0fHJL+rb
	37TvHAPDOQ659R+9t5v6W3FBkqFyu
X-Received: by 2002:ac8:6542:0:b0:528:f72:a986 with SMTP id d75a77b69052e-52d20aa158amr213513661cf.44.1786359021377;
        Mon, 10 Aug 2026 03:50:21 -0700 (PDT)
X-Received: by 2002:ac8:6542:0:b0:528:f72:a986 with SMTP id d75a77b69052e-52d20aa158amr213513261cf.44.1786359020940;
        Mon, 10 Aug 2026 03:50:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea3361esm291881845e9.15.2026.08.10.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:50:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Cengiz Can <cengiz.can@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] gpio: sloppy-logic-analyzer: fix debugfs UAF on unbind
Date: Mon, 10 Aug 2026 12:50:17 +0200
Message-ID: <178635896051.24055.8473937931283111470.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730220258.358169-1-cengiz.can@canonical.com>
References: <20260730220258.358169-1-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J4bDfCBL14ZQsUHvXhDqe89KXNL5kk4S
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79aced cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QKl2Uj663s-KUgA5UvAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: J4bDfCBL14ZQsUHvXhDqe89KXNL5kk4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfXwccjLCOPyWu3
 2mVFH6/Cc3zSvCONumT9Cj3PChlr5/kBorQPprMoa0eNIE876RFgxBqplgv33hXzxq/6W1F6z4q
 ZS+YXII9FJmMMynCCmpNr9sXq7t8NWc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfX7R+PEt3FnAxz
 vul0sm2H+/H+91Vt7AOeNOZt6ic31tOgdb5her9c6kpjskBuvtvdF/5HALZ9kEn9ukDprrOPTeo
 BMF+bRInF8x9gUyfCoMlAO9c0FKt9LS/94P9EvVFG9aY/Os5LmmbTerwsKxVHN8ZwtjsW+QG+Mj
 zxDy53Tj6Eio7/zo5RZgkdvwDiuf76CyJZQfyR0GW7IjAvpPJgj2k8v+pcdnyu5LwGq0Nzq4R19
 yUsq1MNoMzm8TeMAQPzv2Ab3zxG3aD/XUU4UjkuMUzOiJvVCc9ROxoQr5RQSCOX71ygJfGHqsBB
 03kcfIlLdi5Pu16S7jvi5weF5CgtEc4whPRe04bcgRzJhh1X0mS4PmZa94CMkz0VwdoVBrr8665
 MZuxlI9CJ9Ph6OmWQTeYwNkAfm4hq6RpamYiN8Af7Bkv0N+q1junCc9N60NZbn1ebIjbP0hKFNK
 hluff6LbeEDjquyESnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100094


On Fri, 31 Jul 2026 01:02:56 +0300, Cengiz Can wrote:
> Patch 1 fixes a use-after-free. The "trigger" debugfs file uses
> debugfs_create_file_unsafe() with a hand-rolled ->write that dereferences
> the devres-freed gpio_la_poll_priv without holding a debugfs reference, so
> an unbind racing a write frees the object under the handler. Switching to
> debugfs_create_file() makes debugfs_remove_recursive() drain the handler
> first.
> 
> [...]

Applied, thanks!

[1/2] gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind
      https://git.kernel.org/brgl/c/44f3468a0aef1aabdad551898ab7cfa2a9d20e99

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
