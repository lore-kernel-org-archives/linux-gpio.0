Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C03ED3D8
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861581; cv=fail; b=EtGNovyu0KJT9UIdNAr6Ur4/dwEIeafdnWDvMY+SDN2c6qGtDZBp/kYTINm2Lr1I9PRXfPJeNfJw3JliARPXhU79IAHi6/4pbjnONYWSFOYcjti/VXbjR0UGHTlN3TohdEsOkVhSrThWjcR3DShZxleOoIbNCwIEe2Mm31Z/4rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861581; c=relaxed/simple;
	bh=06N+q+fAq+lbTnnu99RzDmnlyPvKhehP0Ro2zxh/yWU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KXtIxNrilDyF1aJ7+AvybtTQyIJ3qStNq4934eyrn64xegyJTW/UQgCMbep7F/RLbIx/Xs5KbPIXixAIRqa9QSCMfzzSe2ltxUlMJb8NfZNoWkeolm42urSlgrslFQVe3meupCh1UgKJLwdWIvKl/+LDXyeEbq7Q8deFqEYptBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j3H15UHn; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j3H15UHn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFDd6kXrm16mk00toRu/ihWzf3lwI27SiDXNmSI7Zoq0D/WPvKOJ4oB9Th4i7iT9+YaXvjxSVmJOI+Acz9zuc3QW6ZFGIomBObZ6Kep7a5qTJQoEjGP9rVDPsW3SqmoxWFEoVgI7ZAoq2JP0edX+zmjqOTAmWd6tq/18NZRVMPfRmYZr2eSLL+GhWhF0sYmbQItaQ7DH3MiH5fMZ5IcBIgwck1qmvNBDyPnhzKJ4kjxVD8UKMj3J4yTPlpsV6qTTIp/FcVt4QZqOgoh5ty+kFeACSdX+42CmduTPkbqgg5jWSsb+TKLgIgxlMEZF4M3TXqJTHst/1oOCgVT9lK7k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAu77YDKa4kFIg+/ztnOWCqqFRIt1o70ItRK7Fk4IeE=;
 b=mSk1G86WfJGZRu/umIcrz9vVTNc36U4DHebKRaKqOHyrHvouFb5wGPuqpKyy5gRJKETlmB8MS1kqrqagtEmQ07qykjbE9L93pMTatA1Mv3S1cu+sscusGE8T0bjx1KaweX91WK68fAbKymfnoVr59crwln5w0h7iagfNLr0PtwWc1jIoXhDTSEanBa09B5nWYE9hBV+Xg87+6IVlVA6sWjWM9VA89XEUDObLxKh5Dkf/VerYKXa40qSRmz7pTemSo3D9SLkh4M/MS4JgoIS5REWLr+HIFvTs9GZfAX9Wdh3YVpAaWo5H3vLLZIbtDYytWvSdguMY70v/nzLnk14Q4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAu77YDKa4kFIg+/ztnOWCqqFRIt1o70ItRK7Fk4IeE=;
 b=j3H15UHn1gmivz7nd+6PHl1flNfny+E1UzqAbmWq05uh7D4mZmdW7WH8IH2cgCKtCy9Nsa3fqyL1W7E5OjJX4R5H4/2gQ/Yd/d8XfRPEycdH+QVrNqAv+/NIPAyuqtWfN18Uy1rWwbBS0niOJES5KgfHswCEDfRsa7wEvehtFl4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 13:32:57 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 13:32:57 +0000
Message-ID: <5cdc49d9-cd19-4f8f-a301-705d595f0a39@amd.com>
Date: Thu, 1 Oct 2026 08:32:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: amd: Add Remote GPIO (RGPIO) bank support
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Shyam-sundar.S-k@amd.com, Matt.Devillier@amd.com,
 Guruvendra.Punugupati@amd.com, linux-gpio@vger.kernel.org
References: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
 <CAD++jLmq45JVz73npFH-dKAWwGwf3_EH+Na_es8C2VmM72wv-Q@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAD++jLmq45JVz73npFH-dKAWwGwf3_EH+Na_es8C2VmM72wv-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:610:e6::22) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|LV5PR12MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0892f5-41b3-4c58-5b71-08df1fc0811f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d/gYQRaDyFvU7kFJR8hK/ipJh4yoxbfH1bfh+//uWeSRCT3jK4gLm+oyvzFiI5cRJ0Eqsb+xsCPiIQPD4RmlbbiC1cD996Z3DPoKiKcqqOzLIZvaDWTYhyGkqYUWVOqgHgvymktOO1LcSGAkpZ5UToNaj1cnLOkpZtjQtFe+5tyo5pRQl3IFsM1TpI3S+9vb3zj/mF5UF4V+xvAm99B88rVpBq8BpdK9SO0ocKEhb0hoKw/82NxtrD3ohwTbs2ZxTqwQyVz5FGTVTUU6Sxa7f7Gzsb1eKBz37v6NvyLFT/ryQbjNvNr+ePrrgUhRD1OgaT5OtzZ7C5NcudqK9bClFph9HMRJjvhBqie52rXeiiTBT1xvsD1GZRLA699HPxHR/zcZ7NepKwSDQ1xs6z1leu+/XN1BRueY2BoFQg9KKCrVEjt+oCbRXLZNj2DJpFTBsYzWOmMBy1p9L+fv7Ig1CAObM2asbOCmY0yoBlgOHeb9tDCJElajrrGoq9qfOq8oMOzqpwEPUoNd/bYHfaJY+BWnRV+xDQpnpR993aCdPWG14c+Oha40Ea4N5rNjZhDdQj7Q5AZiswXt7YpfzOcwbRFOhEIQZkav1ryTkH/VtcSmRxd1VRf09a4HADorXEQFaK15r/YEc7z89OV9huY206NtJLUCNGI/hp7kXf5ju/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTRIVFAwUGhpSjA4NWJHcVM2N1JYNmUvRXJFemt0ZStUQmJhRE81WWJ0S2Fp?=
 =?utf-8?B?NTF2T0NXRjNBMlJvYkticWwwc0NPNFpwZTM0QnM4M3llaFpVYzlURW5kV0Nk?=
 =?utf-8?B?YWYzWTZrc1RyZ2lQVFRnYlN3aFBEMWs5T1VYeHpDL3IzSG9YOWVySlBjMmdp?=
 =?utf-8?B?M01vRC9xcjYyVzNZUGpFckg1bXZ2dS83V3ZQZjVHVDlhZEY0Y1krcnJFMGIw?=
 =?utf-8?B?RDJmQjlBZ1hwb3ZWZkFSZVMvZXU0djVrRGJZVFhsQlRoWHVjNUxwRFJvUWJ6?=
 =?utf-8?B?dVhkb2VDZXAyZWtIVi9HOE9sQXo5WTFJTkNIWjRaTFRzaVJ5c1NFTTVLci9N?=
 =?utf-8?B?VzdUT1VCYTA1N3V1NE1POHRyU2Q1MWlYbmlsQmRxNUdHSXkrNUNZdno3SXhU?=
 =?utf-8?B?bWFNdXY1dFVkczhQWnhxbzdlNTJ2b3hSQThOUHk0UjZXT0phQ1NjOEt1WlU2?=
 =?utf-8?B?Sy9hR0hIVUNQeXJLb2Z0eFhmakZvNWMxQTArUFRPcTQzbGJ5bFhhcnBPajNS?=
 =?utf-8?B?ZldZSi9tQnFMVjZNV1h0SVZFQWRkWWliRnY1bnFBdTl1VjRMQWtDZ05qOGYz?=
 =?utf-8?B?cFJob29qMndlOXBCSzR5MVdEbDBoTi92WGVFOGc1bW5BYm5vV3lXUnpmOGE2?=
 =?utf-8?B?bzIrc0JIMm1GU203UktQbDZudTh0cDYvcjhCblhhVVRyV1M1OUkrMFBjYXl4?=
 =?utf-8?B?UUp0TGg0bHdXWkRYYnNaMlVyT1huZkpZeXlkOXJCQTl6QmRQaDE4L3ZoSTVr?=
 =?utf-8?B?RXBOWDkzLytOOVdoMCsxM1Vad29ZSmlYTTBNUGt6K0tyNU90R3hDOTdFeGJn?=
 =?utf-8?B?eWRncjFqMmRPWTBYaUlsa3JtWFdWdjNCRDVxak9tNzN3VWM0QlVZVHc4ZUVW?=
 =?utf-8?B?eTBxSy9DL1prYW8rZi95L1c0ZldNbXdUK2NmQ3FaUlp1b2hUc1o3dDdMbnBr?=
 =?utf-8?B?bnF4YkhEV1BxSjVic0JwSkRMYXZsTU1UTmlxQkhMN2EweUJkakkvallMazRy?=
 =?utf-8?B?SlM3VGpIUnp2djZraWpXVFAzK1FXV01FbFVKd0hOWWxMNEtrK1dJa0UzUHRL?=
 =?utf-8?B?RGxZekl6S2xNY0dGWGE1ZDE2REFQcmZBbVVRNUhkZTNNYTNZbzZjNTFVSm85?=
 =?utf-8?B?TVJIOWpnSVJtNm5vTi9LWFQzcjc0ZFA2OUlHa0tpM29oYmE1V3gyOFRCbmlB?=
 =?utf-8?B?WkJkaUwzRzdLK2FnYVhrZ1B4ZVRxNUtJcTZxaXp3MTg5UEhDZmkzejV0TUZa?=
 =?utf-8?B?SXhaMVFtS1pDUXE2aUVNT0NWcTREcWRweWUvT1FsRUpBQlA0QUpvOWozazlJ?=
 =?utf-8?B?K0diS3JKRGlEYjZ6endsM28rQ2VRWVNlSmhMcGticjRnc3lrdGtvTGp4VStn?=
 =?utf-8?B?Ly9yVGpOVnFrTVNMR2NOTXpHNVMyNFhqY2NwNHhpUnliSTYxYTh6MnpVK296?=
 =?utf-8?B?U1BiQWZpdy9OWEhDY1BBS0VHYzdCeldxUDlOMGVjT0RPNmZHRU5UZ3gzZG1l?=
 =?utf-8?B?ZUh1VlN2WlRRK01TTVBFZVM0YVBaM0l5V3hSblhqNVVuaThQMTBVeWM2VjlX?=
 =?utf-8?B?bUowQ0ZzSnZLMHVsZDBVOHhIOUJPREdDbXYrbDN2WldVUFJFV2NLQmhVWEpW?=
 =?utf-8?B?L1BzS0ZaaFlGaG5EOVBKdm5HU1RtWU41M1hTS1ExQnlwaDZhSkZLaUVsbVBX?=
 =?utf-8?B?VHFiNU02UjhRVWUvZlNvdFVNN0FVZWhlbVJ1czJrbk5TbXNkeHNuRlBQVjZw?=
 =?utf-8?B?ajVEOVVjNkhObUhiODgyY0Foc0tiMFNzWU1SWXVDNTZ6WGoxZE5ndGJPYTJj?=
 =?utf-8?B?MDVydGNEUUx2dXh1VE5DQTlNdzMrcWtuWlpEMndxWkhISEJOSW5uSE0xU1F3?=
 =?utf-8?B?ZmVqWlkwNjZQaWxPRS9nc3lzNERITCtNUjM3ZlRlNUo0YXlOQ3NEQ3NHMW11?=
 =?utf-8?B?U0JOYmwzTTZhdFo1bzNkLzdTd1VFR1lMMkt5blpsUCtzUmdYZDNKWkthRFls?=
 =?utf-8?B?YW9KUDhtKzd1ckZlUm9Oc3V3RnIyakg0K3hnWlEvdnlqa3haZmlCcERNR3Rp?=
 =?utf-8?B?aVpNbVRtZFViM0lXWmtieEdSVHlVbDhibFZOTW4rSGZmaFc4N3BOdFc0bFB6?=
 =?utf-8?B?UXk0WlgrNTdodUpPK3UwTTRzR0JhcXIrUDJ2NTNXbkJxVVVxR1lvSTBvZDd6?=
 =?utf-8?B?WXMwckJFYjVIdEJFekxVUm5RejVXWDNhY0RNMlByRTVIRjRKOE1CMHJ3WC9N?=
 =?utf-8?B?dkZmMHZPckRCNjBVUGc5Ykw5QmNlc05DelFldFNndnkvVGRKWG5hSC9IOFl0?=
 =?utf-8?Q?/bPAbi5d3PXsK5ky8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0892f5-41b3-4c58-5b71-08df1fc0811f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:32:57.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf/VO6+5NuRm1RkaS7Iuz7kJE5qxC7mpQOc07//kEGLCbh5LLpaT6EvM7tVVQzhTTMiDbl5cSsiw/wErdIxw+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9828



On 10/1/26 01:48, Linus Walleij wrote:
> On Mon, Sep 21, 2026 at 7:28 AM Basavaraj Natikar
> <Basavaraj.Natikar@amd.com> wrote:
> 
>> Some AMD platforms expose a second GPIO register bank, Remote GPIO
>> (RGPIO), covering pins 256-271 through a separate MMIO region that the
>> platform advertises by name. This series adds support for it.
>>
>> The first two patches are preparation: one centralizes per-pin register
>> access behind a single helper, the other factors the optional
>> named-resource lookup into a reusable helper with a minimum-size check.
>> The last patch adds the RGPIO bank itself, including its pins, groups,
>> pinmux and interrupts.
>>
>> The RGPIO pins are registered only when the platform advertises the
>> region and the main bank spans the expected number of registers, so
>> platforms that do not expose it are unaffected.
> 
> Patches applied tentatively, I see Mario isn't on CC for the
> patch series so adding him now. If he sees some issue with them
> I can still take them out.
> 
> Yours,
> Linus Walleij

No concerns on my side, thanks!
